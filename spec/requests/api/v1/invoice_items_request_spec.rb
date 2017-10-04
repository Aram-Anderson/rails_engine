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
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
    end
  end

  context "GET /invoice_items/find?parameters" do
    it "can find an invoice_item by id" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
      expect(invoice_item_response["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["invoice_id"]).to eq(invoice_item.invoice_id)
    end

    it "can find an invoice_item by quantity" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
      expect(invoice_item_response["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["invoice_id"]).to eq(invoice_item.invoice_id)
    end

    it "can find an invoice_item by created_at" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
      expect(invoice_item_response["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["invoice_id"]).to eq(invoice_item.invoice_id)
    end

    it "can find an invoice_item by updated_at" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"
      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
      expect(invoice_item_response["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["invoice_id"]).to eq(invoice_item.invoice_id)
    end

    it "can find an invoice_item by item_id" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
      expect(invoice_item_response["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["invoice_id"]).to eq(invoice_item.invoice_id)
    end

    it "can find an invoice_item by invoice_id" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

      invoice_item_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_response["id"]).to eq(invoice_item.id)
      expect(invoice_item_response["quantity"]).to eq(invoice_item.quantity)
      expect(invoice_item_response["unit_price"]).to eq((invoice_item.unit_price.to_f / 100).round(2).to_s)
      expect(invoice_item_response["item_id"]).to eq(invoice_item.item_id)
      expect(invoice_item_response["invoice_id"]).to eq(invoice_item.invoice_id)
    end
  end

  context "GET /invoice_items/find_all?parameters" do
    it "can find all invoice_items by quantity" do
      invoice_item_1 = create(:invoice_item, quantity: 1)
      invoice_item_2 = create(:invoice_item, quantity: 1)
      invoice_item_3 = create(:invoice_item, quantity: 2)

      get "/api/v1/invoice_items/find_all?quantity=#{invoice_item_1.quantity}"

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first["id"]).to eq(invoice_item_1.id)
    end

    it "can find all invoice_items by created_at" do
      invoice_item_1 = create(:invoice_item, created_at: "2017-10-03 20:20:20")
      invoice_item_2 = create(:invoice_item, created_at: "2017-10-03 20:20:20")
      invoice_item_3 = create(:invoice_item, created_at: "2017-05-02 21:21:21")

      get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_1.created_at.to_s}"

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first["id"]).to eq(invoice_item_1.id)
    end

    it "can find all invoice_items by updated_at" do
      invoice_item_1 = create(:invoice_item, updated_at: "2017-10-03 20:20:20")
      invoice_item_2 = create(:invoice_item, updated_at: "2017-10-03 20:20:20")
      invoice_item_3 = create(:invoice_item, updated_at: "2017-10-03 21:21:21")

      get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item_1.updated_at.to_s}"

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first["id"]).to eq(invoice_item_1.id)
    end

    it "can find all invoice_items by item_id" do
      item_1 = create(:item, id: 1)
      item_2 = create(:item, id: 2)

      invoice_item_1 = create(:invoice_item, item_id: item_1.id)
      invoice_item_2 = create(:invoice_item, item_id: item_1.id)
      invoice_item_3 = create(:invoice_item, item_id: item_2.id)

      get "/api/v1/invoice_items/find_all?item_id=#{invoice_item_1.item_id}"

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first["id"]).to eq(invoice_item_1.id)
    end

    it "can find all invoice_items by invoice_id" do
      invoice_1 = create(:invoice, id: 1)
      invoice_2 = create(:invoice, id: 2)
      invoice_item_1 = create(:invoice_item, invoice_id: invoice_1.id)
      invoice_item_2 = create(:invoice_item, invoice_id: invoice_1.id)
      invoice_item_3 = create(:invoice_item, invoice_id: invoice_2.id)

      get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_item_1.invoice_id}"

      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first["invoice_id"]).to eq(invoice_1.id)
    end
  end
  context "GET /invoice_items/random" do
    it "can find a random invoice_item" do
      invoice_item_1 = create(:invoice_item)
      invoice_item_2 = create(:invoice_item)

      get "/api/v1/invoice_items/random"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item["quantity"]).to eq(invoice_item_1.quantity).or eq(invoice_item_2.quantity)
    end
  end
end
