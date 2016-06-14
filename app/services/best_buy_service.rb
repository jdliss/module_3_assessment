class BestBuyService
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/v1")
  end

  def get_stores(zip)
    key = ENV["KEY"].dup
    @conn.get("/stores(area(#{zip},25))"), { apiKey: key, format: "json" }
  end

  def parse(input)
    JSON.parse(input.body)
  end
end
