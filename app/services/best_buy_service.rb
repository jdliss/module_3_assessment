class BestBuyService
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com")
  end

  def get_stores(zip)
    response = conn.get do |req|
      req.url "/stores(area(#{zip},25))"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["KEY"].dup
    end
    # key = ENV["KEY"].dup
    # response = @conn.get("/stores(area(#{zip},25))"), { format: "json", "apiKey" => key }
    parse(response.first)
  end

  def parse(input)
    JSON.parse(input.body)
  end
end
