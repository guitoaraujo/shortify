class FetchTitlesWorker
  include Sidekiq::Worker

  def perform(site_id)
    site = Site.find(site_id)
    driver = Mechanize.new
    driver.get(site.long_url) do |page|
      site.update(title: page.title)
    end
  end
end
