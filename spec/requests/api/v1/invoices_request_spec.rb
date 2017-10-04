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
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end
  end

  context "GET /invoices/find?parameters" do
    it "can find an invoice by id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "can find an invoice by status" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?status=#{invoice.status}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "can find an invoice by created_at" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "can find an invoice by updated_at" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"
      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "can find an invoice by customer_id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "can find an invoice by merchant_id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end
  end

  context "GET /invoices/find_all?parameters" do
    it "can find all invoices by status" do
      invoice_1 = create(:invoice, status: "shipped")
      invoice_2 = create(:invoice, status: "shipped")
      invoice_3 = create(:invoice, status: "ordered")

      get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(2)
      expect(invoices.first["id"]).to eq(invoice_1.id)
    end

    it "can find all invoices by created_at" do
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice, updated_at: "01-02-2017")
      invoice_3 = create(:invoice)

      get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(3)
      expect(invoices.first["id"]).to eq(invoice_1.id)
    end

    it "can find all invoices by updated_at" do
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)
      invoice_3 = create(:invoice, updated_at: "01-02-2017")

      get "/api/v1/invoices/find_all?updated_at=#{invoice_1.updated_at}"

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(2)
      expect(invoices.first["id"]).to eq(invoice_1.id)
    end

    it "can find all invoices by customer_id" do
      customer_1 = create(:customer, id: 1)
      customer_2 = create(:customer, id: 2)

      invoice_1 = create(:invoice, customer_id: customer_1.id)
      invoice_2 = create(:invoice, customer_id: customer_1.id)
      invoice_3 = create(:invoice, customer_id: customer_2.id)

      get "/api/v1/invoices/find_all?customer_id=#{invoice_1.customer_id}"

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(2)
      expect(invoices.first["id"]).to eq(invoice_1.id)
    end

    it "can find all invoices by merchant_id" do
      merchant_1 = create(:merchant, id: 1)
      merchant_2 = create(:merchant, id: 2)
      invoice_1 = create(:invoice, merchant_id: merchant_1.id)
      invoice_2 = create(:invoice, merchant_id: merchant_1.id)
      invoice_3 = create(:invoice, merchant_id: merchant_2.id)

      get "/api/v1/invoices/find_all?merchant_id=#{invoice_1.merchant_id}"

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(2)
      expect(invoices.first["id"]).to eq(invoice_1.id)
    end
  end
end
