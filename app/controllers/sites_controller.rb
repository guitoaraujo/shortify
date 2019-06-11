class SitesController < ApplicationController
  def index
    @sites = Site.most_visited
  end

  def new
    @site = Site.new
  end

  def create
    @site     = Site.new(site_params)
    response  = Sites::Shortify.call(@site).response
    if @site.save && response
      FetchTitlesWorker.perform_async(@site.id)
      redirect_to sites_path, notice:'The URL was successfully shortified!'
    else
      render :new, alert: 'Error. Please try again.'
    end
  end

  def populate
    Sites::Populate.call if Site.count < 100
    redirect_to sites_path, notice:'You successfully requested new sites '
  end

  private

    def site_params
      params.require(:site).permit(:long_url)
    end
end
