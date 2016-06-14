class BestBuyService
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1")
    # @conn.headers["apiKey"] = ENV["KEY"]
  end

  def get_stores(zip)
    require "pry"; binding.pry
    parsed = parse(@conn.get(URI.encode("/stores(area(#{zip}, 25))?apiKey=#{ENV["KEY"].dup}")))
    require "pry"; binding.pry
  end

  def parse(input)
    JSON.parse(input.body)
  end
end
