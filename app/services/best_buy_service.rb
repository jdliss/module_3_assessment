class BestBuyService
  def initialize
    @conn = Faraday.new(url: "https://api.bestbuy.com/")
  end

  def get_stores(zip)
    resp = @conn.get do |req|
      req.url "/v1/stores(area(#{zip},25))"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["KEY"]
      req.params['pageSize'] = 15
    end
    parse(resp)
  end

  def get_a_store(id)
    resp = @conn.get do |req|
      req.url "/v1/stores(storeId=#{id})"
      req.params['format'] = "json"
      req.params['apiKey'] = ENV["KEY"]
      req.params['pageSize'] = 15
    end
    parse(resp)
  end

  def parse(input)
    JSON.parse(input.body)
  end

end
