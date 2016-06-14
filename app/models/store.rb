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
    @id = hash["storeId"]
  end

  def self.find(zip)
    service.get_stores(zip)["stores"].map do |s|
      new(s)
    end
  end

  def self.total(zip)
    service.get_stores(zip)["total"]
  end

  def self.service
    BestBuyService.new
  end
end
