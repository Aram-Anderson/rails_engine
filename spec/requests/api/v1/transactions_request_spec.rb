require 'rails_helper'

describe "Transactions API" do
  context "GET /transactions" do
    it "sends a list of transactions" do
      create_list(:transaction, 3)

      get '/api/v1/transactions'

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(3)
    end
  end

  context "GET /transactions/:id" do
    it "sends specified transaction" do
      transaction = create(:transaction)

      get "/api/v1/transactions/#{transaction.id}.json"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
    end
  end

  context "GET /transactions/find?parameters" do
    xit "can find an transaction by id" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?id=#{transaction.id}"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["name"]).to eq(transaction.name)
    end
  end
end