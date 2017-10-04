require 'rails_helper'

describe "Items API" do
  context "GET /items" do
    it "sends a list of items" do
      create_list(:item, 3)

      get '/api/v1/items'

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
  end

  context "GET /items/:id" do
    it "sends specified item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}.json"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
    end
  end

  context "GET /items/find?parameters" do
    xit "can find an item by id" do
      item = create(:item)

      get "/api/v1/items/find?id=#{item.id}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["unit_price"]).to eq(item.unit_price)
    end
  end
end
