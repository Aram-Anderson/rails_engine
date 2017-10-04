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
    it "can find an item by id" do
      item = create(:item)

      get "/api/v1/items/find?id=#{item.id}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "can find an item by name" do
      item = create(:item)

      get "/api/v1/items/find?name=#{item.name}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "can find an item by created_at" do
      item = create(:item)

      get "/api/v1/items/find?created_at=#{item.created_at}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "can find an item by updated_at" do
      item = create(:item)

      get "/api/v1/items/find?updated_at=#{item.updated_at}"
      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "can find an item by description" do
      item = create(:item)

      get "/api/v1/items/find?description=#{item.description}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "can find an item by unit_price" do
      item = create(:item)

      get "/api/v1/items/find?unit_price=#{item.unit_price}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end

    it "can find an item by merchant_id" do
      item = create(:item)

      get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

      item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_response["id"]).to eq(item.id)
      expect(item_response["name"]).to eq(item.name)
      expect(item_response["description"]).to eq(item.description)
      expect(item_response["unit_price"]).to eq((item.unit_price.to_f / 100).round(2).to_s)
      expect(item_response["merchant_id"]).to eq(item.merchant_id)
    end
  end

  context "GET /items/find_all?parameters" do
    it "can find all items by name" do
      item_1 = create(:item, name: 1)
      item_2 = create(:item, name: 1)
      item_3 = create(:item, name: 2)

      get "/api/v1/items/find_all?name=#{item_1.name}"

      items = JSON.parse(response.body)

      expect(items.count).to eq(2)
      expect(items.first["id"]).to eq(item_1.id)
    end

    it "can find all items by created_at" do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)

      get "/api/v1/items/find_all?created_at=#{item_1.created_at}"

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
      expect(items.first["id"]).to eq(item_1.id)
    end

    it "can find all items by updated_at" do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item)

      get "/api/v1/items/find_all?updated_at=#{item_1.updated_at}"

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
      expect(items.first["id"]).to eq(item_1.id)
    end

    it "can find all items by description" do
      item_1 = create(:item, description: 1)
      item_2 = create(:item, description: 1)
      item_3 = create(:item, description: 2)

      get "/api/v1/items/find_all?description=#{item_1.description}"

      items = JSON.parse(response.body)

      expect(items.count).to eq(2)
      expect(items.first["id"]).to eq(item_1.id)
    end

    it "can find all items by unit_price" do
      item_1 = create(:item)
      item_2 = create(:item)
      item_3 = create(:item, unit_price: 999)

      get "/api/v1/items/find_all?unit_price=#{item_1.unit_price}"

      items = JSON.parse(response.body)

      expect(items.count).to eq(2)
      expect(items.first["id"]).to eq(item_1.id)
    end

    it "can find all items by merchant_id" do
      merchant_1 = create(:merchant, id: 1)
      merchant_2 = create(:merchant, id: 2)
      item_1 = create(:item, merchant_id: merchant_1.id)
      item_2 = create(:item, merchant_id: merchant_1.id)
      item_3 = create(:item, merchant_id: merchant_2.id)

      get "/api/v1/items/find_all?merchant_id=#{item_1.merchant_id}"

      items = JSON.parse(response.body)

      expect(items.count).to eq(2)
      expect(items.first["id"]).to eq(item_1.id)
    end
  end

  context "GET /items/random" do
    it "can find a random item" do
      item_1 = create(:item)
      item_2 = create(:item)

      get "/api/v1/items/random"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["name"]).to eq(item_1.name).or eq(item_2.name)
    end
  end
end
