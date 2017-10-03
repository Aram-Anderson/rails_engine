require 'rails_helper'

describe "Invoices API" do
  context "GET /invoices" do
    it "sends a list of invoices" do
      create_list(:invoice, 3)

      get '/api/v1/invoices'

      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq(3)
    end
  end

  context "GET /invoices/:id" do
    it "sends specified item" do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}.json"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["status"]).to eq("Pending")
    end
  end

  context "GET /invoices/find?parameters" do
    it "can find an invoice by id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
    end
  end
end