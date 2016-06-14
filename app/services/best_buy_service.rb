class BestBuyService
  def initialize
    @conn = Faraday.new("https://api.bestbuy.com/v1/stores")
    @conn.headers["apiKey"] = ENV["KEY"]
  end

  def get_stores(zip)
    @conn.get("(area(#{zip}, 25))")
  end
end
