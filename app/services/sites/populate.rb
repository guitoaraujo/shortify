module Sites
  class Populate

    def self.call
      this = new
      this.call
      this
    end

    def call
      find_sites
    end

    private

      def find_sites
        driver = Mechanize.new
        urls = %w(
          https://www.google.com/search?q=worldcup,
          https://www.google.com/search?q=rockinrio,
          https://www.google.com/search?q=europe,
          https://www.google.com/search?q=rubyonrails,
          https://www.google.com/search?q=technologies
        )

        driver.get(urls.sample) do |page|
          page.links.each_with_index do |link, index|
            break if index >= 4
            title = link.click.title
            site  = Site.create(long_url: link.href, title: title, visits: rand(1..100))
            Sites::Shortify.call(site)
          end
        end
      end
  end
end