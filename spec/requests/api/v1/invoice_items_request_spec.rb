require 'rails_helper'

describe "Invoice Items API" do
  context "GET /invoice_items" do
    it "sends a list of invoice_items" do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
    end
  end

  context "GET /invoice_items/:id" do
    it "sends specified item" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}.json"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq(invoice_item.unit_price)
    end
  end

  context "GET /invoice_items/find?parameters" do
    xit "can find an invoice_item by id" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
    end
  end
end