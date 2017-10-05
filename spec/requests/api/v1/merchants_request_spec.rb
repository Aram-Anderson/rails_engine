require 'rails_helper'

describe "Merchants API" do
  context "GET /merchants" do
    it "sends a list of merchants" do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq(3)
    end
  end

  context "GET /merchants/:id" do
    it "sends specified merchant" do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}.json"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response["id"]).to eq(merchant.id)
      expect(merchant_response["name"]).to eq(merchant.name)
    end
  end

  context "GET /merchants/find?parameters" do
    it "can find a merchant by id" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?id=#{merchant.id}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response["id"]).to eq(merchant.id)
      expect(merchant_response["name"]).to eq(merchant.name)
    end

    it "can find a merchant by name" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?name=#{merchant.name}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response["id"]).to eq(merchant.id)
      expect(merchant_response["name"]).to eq(merchant.name)
    end

    it "can find a merchant by created_at" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response["id"]).to eq(merchant.id)
      expect(merchant_response["name"]).to eq(merchant.name)
    end

    it "can find a merchant by updated_at" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response["id"]).to eq(merchant.id)
      expect(merchant_response["name"]).to eq(merchant.name)
    end
  end

  context "GET /merchants/find_all?parameters" do
    it "can find all merchants by name" do
      merchant_1 = create(:merchant, name: 1)
      merchant_2 = create(:merchant, name: 1)
      merchant_3 = create(:merchant, name: 2)

      get "/api/v1/merchants/find_all?name=#{merchant_1.name}"

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(2)
      expect(merchants.first["id"]).to eq(merchant_1.id)
    end

    it "can find all merchants by created_at" do
      merchant_1 = create(:merchant, created_at: "2017-10-03 20:20:20")
      merchant_2 = create(:merchant, created_at: "2017-10-03 20:20:20")
      merchant_3 = create(:merchant, created_at: "2017-05-02 21:21:21")

      get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at.to_s}"

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(2)
      expect(merchants.first["id"]).to eq(merchant_1.id)
    end

    it "can find all merchants by updated_at" do
      merchant_1 = create(:merchant, updated_at: "2017-10-03 20:20:20")
      merchant_2 = create(:merchant, updated_at: "2017-10-03 20:20:20")
      merchant_3 = create(:merchant, updated_at: "2017-10-03 21:21:21")

      get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at.to_s}"

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(2)
      expect(merchants.first["id"]).to eq(merchant_1.id)
    end
  end

  context "GET /merchants/random" do
    it "can find a random merchant" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)

      get "/api/v1/merchants/random"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["name"]).to eq(merchant_1.name).or eq(merchant_2.name)
    end
  end

  context "GET merchants relationships" do
    it "can returns a collection of items associated with that merchant" do
      merchant = create(:merchant, id: 1)
      create(:merchant, id: 2)
      item_1 = create(:item, merchant_id: 1)
      item_2 = create(:item, merchant_id: 1)
      item_3 = create(:item, merchant_id: 2)

      get "/api/v1/merchants/#{merchant.id}/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(2)
    end
  end
end