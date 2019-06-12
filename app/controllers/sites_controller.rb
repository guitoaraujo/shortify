class SitesController < ApplicationController
  def index
    @sites = Site.most_visited
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site     = Site.new(site_params)
    response  = Sites::Shortify.call(@site).response
    if @site.save && response
      FetchTitlesWorker.perform_async(@site.id)
      redirect_to site_path(@site), notice:'The URL was successfully shortified!'
    else
      render :new, alert: 'Error. Please try again.'
    end
  end

  def populate
    Sites::Populate.call if Site.count < 20
    redirect_to sites_path, notice:'You successfully requested new sites '
  end

  def get_long_url
    @site = Site.find_by(shor_url: params[:shor_url])
    if @site
      @site.update(visits: @site.visits + 1)
      redirect_to @site.long_url
    else
      redirect_to sites_path, alert: 'Site not found.'
    end
  end

  private

    def site_params
      params.require(:site).permit(:long_url)
    end
end
