class FetchTitlesWorker
  include Sidekiq::Worker

  def perform(site_id)
    site = Site.find(site_id)
    driver = Mechanize.new
    driver.get(site.long_url) do |page|
      title = page.title.gsub("\n", ' ').squeeze(' ')
      site.update(title: title)
    end
  end
end
