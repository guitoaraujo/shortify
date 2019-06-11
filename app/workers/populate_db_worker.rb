class PopulateDbWorker
  include Sidekiq::Worker

  def perform
    driver = Mechanize.new
    urls = %w(
      https://www.google.com/search?q=worldcup,
      https://www.google.com/search?q=rockinrio,
      https://www.google.com/search?q=europe,
      https://www.google.com/search?q=rubyonrails,
      https://www.google.com/search?q=technologies
    )

    urls.each do |url|
      driver.get(url) do |page|
        page.links.each do |link|
          Site.create(long_url: link.href)
        end
      end
    end
  end
end
