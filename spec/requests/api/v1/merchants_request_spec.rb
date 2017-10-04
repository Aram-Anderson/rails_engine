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
    xit "can find an merchant by id" do
      merchant = create(:merchant)

      get "/api/v1/merchants/find?id=#{merchant.id}"

      merchant_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_response["id"]).to eq(merchant.id)
      expect(merchant_response["name"]).to eq(merchant.name)
    end
  end
end