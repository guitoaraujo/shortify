class SitesController < ApplicationController
  def index
    @sites = Site.all.order(visits: :desc).limit(100)
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

  private

    def site_params
      params.require(:site).permit(:long_url)
    end
end
