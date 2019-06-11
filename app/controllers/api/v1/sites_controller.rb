class Api::V1::SitesController < ActionController::Base
  def show
    return false if params[:long_url].blank?
    site      = Site.find_or_create_by(long_url: params[:long_url])
    response  = Sites::Shortify.call(site).response
    if response
      FetchTitlesWorker.perform_async(site.id)
      render json: { status: 200, shor_url: site.shor_url }
    else
      render json: { status: 204, shor_url: nil }
    end
  end
end