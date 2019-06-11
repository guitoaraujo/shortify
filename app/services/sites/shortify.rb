module Sites
  class Shortify
    attr_accessor :response

    def initialize(site)
      @site       = site
      @shor_urls  = Site.all.map(&:shor_url)
      @shor_url   = site.shor_url
    end

    def self.call(data)
      this = new(data)
      this.call
      this
    end

    def call
      @response = get_shor_url
    end

    private

      def get_shor_url
        begin
          @shor_url = [(0..9).to_a,('A'..'Z').to_a,('a'..'z').to_a].flatten.sample(7).join
        end while @shor_urls.include?(@shor_url)
        @site.shor_url = "http://shortify.com/#{@shor_url}"
        @site.save
      end
  end
end