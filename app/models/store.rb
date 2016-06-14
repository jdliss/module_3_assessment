class Store
  def initialize(hash)
    require "pry"; binding.pry
  end

  def self.find(zip)
    service = BestBuyService.new
    service.get_stores(zip).map do |s|
      new(s)
    end
  end
end
