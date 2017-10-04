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
    xit "can find all invoices by id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    xit "can find all invoices by status" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?status=#{invoice.status}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    xit "can find all invoices by created_at" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?created_at=#{invoice.created_at.to_s}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    xit "can find all invoices by updated_at" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at.to_s}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    xit "can find all invoices by customer_id" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

      invoice_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_response["id"]).to eq(invoice.id)
      expect(invoice_response["status"]).to eq(invoice.status)
      expect(invoice_response["customer_id"]).to eq(invoice.customer_id)
      expect(invoice_response["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "can find all invoices by merchant_id" do
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
end
