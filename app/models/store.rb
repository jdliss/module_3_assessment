class Store
  attr_reader :long_name,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(hash)
    @long_name = hash["longName"]
    @city = hash["city"]
    @distance = hash["distance"]
    @phone_number = hash["phone"]
    @store_type = hash["storeType"]
  end

  def self.find(zip)
    service = BestBuyService.new
    service.get_stores(zip)["stores"].map do |s|
      new(s)
    end
  end
end
