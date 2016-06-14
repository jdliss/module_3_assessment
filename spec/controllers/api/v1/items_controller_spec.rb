require 'rails_helper'

RSpec.describe Api::V1::ItemsController do
  context "GET /api/v1/items" do
    it "returns all Items" do
      Item.create(
        name: "item1",
        description: "description1",
        image_url: "url1"
      )
      Item.create(
        name: "item2",
        description: "description2",
        image_url: "url2"
      )
      Item.create(
        name: "item3",
        description: "description3",
        image_url: "url3"
      )

      get :index, format: :json

      require "pry"; binding.pry

    end
  end
end
