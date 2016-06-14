require 'rails_helper'

describe BestBuyService do
  context "#get_stores" do
    it "returns stores by zip" do
      VCR.use_cassette("best_buy_service/store_hash") do
        service = BestBuyService.new
        store_hash = {"storeId"=>2740,
         "storeType"=>"Mobile",
         "tradeIn"=>"Trade-In – Best Buy receipt required",
         "name"=>"Cherry Creek Shopping Center",
         "longName"=>"Best Buy Mobile - Cherry Creek Shopping Center",
         "address"=>"3000 East First Ave",
         "address2"=>"#296",
         "city"=>"Denver",
         "region"=>"CO",
         "fullPostalCode"=>"80206",
         "country"=>"US",
         "lat"=>39.716579,
         "lng"=>-104.957457,
         "hours"=>"Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6",
         "hoursAmPm"=>"Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm",
         "gmtOffset"=>-7,
         "services"=>[{"service"=>"Best Buy Mobile Specialty Store"}, {"service"=>"Electronics Recycling"}],
         "phone"=>"303-270-9189",
         "postalCode"=>"80206",
         "distance"=>3.25
        }

         parsed = service.get_stores("80202")
        expect(parsed["total"]).to eq 17
        expect(parsed["stores"].first).to eq store_hash
      end
    end
  end
end
