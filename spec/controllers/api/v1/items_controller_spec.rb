require 'rails_helper'

RSpec.describe Api::V1::ItemsController do
  context "GET /api/v1/items" do
    it "returns all Items" do
      item1 = Item.create(
        name: "item1",
        description: "description1",
        image_url: "url1"
      )
      item2 = Item.create(
        name: "item2",
        description: "description2",
        image_url: "url2"
      )
      item3 = Item.create(
        name: "item3",
        description: "description3",
        image_url: "url3"
      )

      get :index, format: :json

      items_hash = JSON.parse(response.body)

      expect(response).to have_http_status 200
      expect(items_hash.first["name"]).to eq "item1"
      expect(items_hash.second["name"]).to eq "item2"
      expect(items_hash.third["name"]).to eq "item3"
      expect(items_hash.first["description"]).to eq "description1"
      expect(items_hash.second["description"]).to eq "description2"
      expect(items_hash.third["description"]).to eq "description3"
      expect(items_hash.first["image_url"]).to eq "url1"
      expect(items_hash.second["image_url"]).to eq "url2"
      expect(items_hash.third["image_url"]).to eq "url3"
      expect(items_hash.first["created_at"]).to eq nil
      expect(items_hash.first["updated_at"]).to eq nil
      expect(items_hash.second["created_at"]).to eq nil
      expect(items_hash.second["updated_at"]).to eq nil
      expect(items_hash.third["created_at"]).to eq nil
      expect(items_hash.third["updated_at"]).to eq nil
    end
  end

  context "GET /api/v1/items/:id" do
    it "returns all Items" do
      item = Item.create(
        name: "item1",
        description: "description1",
        image_url: "url1"
      )
      get :show, format: :json, id: item.id

      items_hash = JSON.parse(response.body)

      expect(response).to have_http_status 200
      expect(items_hash["name"]).to eq "item1"
      expect(items_hash["description"]).to eq "description1"
      expect(items_hash["image_url"]).to eq "url1"
      expect(items_hash["created_at"]).to eq nil
      expect(items_hash["updated_at"]).to eq nil
    end
  end

  context "DELETE /api/v1/items:id" do
    it "returns all Items" do
      item = Item.create(
        name: "item1",
        description: "description1",
        image_url: "url1"
      )
      delete :destroy, format: :json, id: item.id

      items_hash = JSON.parse(response.body)

      expect(response).to have_http_status 200
      expect(items_hash["name"]).to eq "item1"
      expect(items_hash["description"]).to eq "description1"
      expect(items_hash["image_url"]).to eq "url1"
      expect(items_hash["created_at"]).to eq nil
      expect(items_hash["updated_at"]).to eq nil
    end
  end
end
