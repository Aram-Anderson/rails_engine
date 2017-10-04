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
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end
  end

  context "GET /transactions/find?parameters" do
    it "can find a transaction by id" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?id=#{transaction.id}"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end

    it "can find a transaction by invoice_id" do
      invoice_1 = create(:invoice)
      transaction = create(:transaction, invoice_id: invoice_1.id)

      get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end

    it "can find a transaction by created_at" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end

    it "can find a transaction by updated_at" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"
      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end

    it "can find a transaction by credit_card_number" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"
      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end

    it "can find a transaction by credit_card_expiration_date" do
      transaction = create(:transaction, credit_card_expiration_date: 1)

      get "/api/v1/transactions/find?credit_card_expiration_date=#{transaction.credit_card_expiration_date}"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end

    it "can find a transaction by result" do
      transaction = create(:transaction)

      get "/api/v1/transactions/find?result=#{transaction.result}"

      transaction_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_response["id"]).to eq(transaction.id)
      expect(transaction_response["invoice_id"]).to eq(transaction.invoice_id)
      expect(transaction_response["credit_card_number"]).to eq(transaction.credit_card_number.to_s)
      expect(transaction_response["credit_card_expiration_date"]).to eq(transaction.credit_card_expiration_date)
      expect(transaction_response["result"]).to eq(transaction.result)
    end
  end

  context "GET /transactions/find_all?parameters" do
    it "can find all transactions by invoice_id" do
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)
      transaction_1 = create(:transaction, invoice_id: invoice_1.id)
      transaction_2 = create(:transaction, invoice_id: invoice_1.id)
      transaction_3 = create(:transaction, invoice_id: invoice_2.id)
      get "/api/v1/transactions/find_all?invoice_id=#{transaction_1.invoice_id}"

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(2)
      expect(transactions.first["id"]).to eq(transaction_1.id)
    end

    it "can find all transactions by created_at" do
      transaction_1 = create(:transaction, created_at: "2017-10-03 20:20:20")
      transaction_2 = create(:transaction, created_at: "2017-10-03 20:20:20")
      transaction_3 = create(:transaction, created_at: "2017-05-02 21:21:21")

      get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at.to_s}"

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(2)
      expect(transactions.first["id"]).to eq(transaction_1.id)
    end

    it "can find all transactions by updated_at" do
      transaction_1 = create(:transaction, updated_at: "2017-10-03 20:20:20")
      transaction_2 = create(:transaction, updated_at: "2017-10-03 20:20:20")
      transaction_3 = create(:transaction, updated_at: "2017-10-03 21:21:21")

      get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at.to_s}"

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(2)
      expect(transactions.first["id"]).to eq(transaction_1.id)
    end

    it "can find all transactions by credit_card_number" do
      transaction_1 = create(:transaction, credit_card_number: 1)
      transaction_2 = create(:transaction, credit_card_number: 1)
      transaction_3 = create(:transaction, credit_card_number: 2)

      get "/api/v1/transactions/find_all?credit_card_number=#{transaction_1.credit_card_number}"

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(2)
      expect(transactions.first["id"]).to eq(transaction_1.id)
    end

    it "can find all transactions by credit_card_expiration_date" do
      transaction_1 = create(:transaction, credit_card_expiration_date: 1)
      transaction_2 = create(:transaction, credit_card_expiration_date: 1)
      transaction_3 = create(:transaction, credit_card_expiration_date: 2)

      get "/api/v1/transactions/find_all?credit_card_expiration_date=#{transaction_1.credit_card_expiration_date}"

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(2)
      expect(transactions.first["id"]).to eq(transaction_1.id)
    end

    it "can find all transactions by result" do
      transaction_1 = create(:transaction, result: 1)
      transaction_2 = create(:transaction, result: 1)
      transaction_3 = create(:transaction, result: 2)

      get "/api/v1/transactions/find_all?result=#{transaction_1.result}"

      transactions = JSON.parse(response.body)

      expect(transactions.count).to eq(2)
      expect(transactions.first["id"]).to eq(transaction_1.id)
    end
  end

  context "GET /transactions/random" do
    it "can find a random transaction" do
      transaction_1 = create(:transaction)
      transaction_2 = create(:transaction)

      get "/api/v1/transactions/random"

      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction["result"]).to eq(transaction_1.result).or eq(transaction_2.result)
    end
  end
end
