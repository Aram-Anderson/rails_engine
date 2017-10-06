require 'rails_helper'

def test_prep
  customer_1 = create(:customer)
  customer_2 = create(:customer)
  customer_3 = create(:customer)
  merchant_1 = create(:merchant)
  merchant_2 = create(:merchant)
  merchant_3 = create(:merchant)
  invoice_1 = create(:invoice, customer_id: customer_1.id, merchant_id: merchant_1.id, created_at: "2014-02-27 14:54:09 UTC")
  invoice_2 = create(:invoice, customer_id: customer_1.id, merchant_id: merchant_1.id)
  invoice_3 = create(:invoice, customer_id: customer_1.id, merchant_id: merchant_2.id)
  invoice_4 = create(:invoice, customer_id: customer_2.id, merchant_id: merchant_1.id)
  invoice_5 = create(:invoice, customer_id: customer_2.id, merchant_id: merchant_3.id)
  invoice_6 = create(:invoice, customer_id: customer_3.id, merchant_id: merchant_3.id, status: "pending")
  item_1 = create(:item, merchant_id: merchant_1.id)
  item_2 = create(:item, merchant_id: merchant_1.id)
  item_3 = create(:item, merchant_id: merchant_1.id)
  item_4 = create(:item, merchant_id: merchant_2.id)
  item_5 = create(:item, merchant_id: merchant_2.id)
  item_6 = create(:item, merchant_id: merchant_3.id)
  invoice_item_1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: 1, quantity: 10)
  invoice_item_2 = create(:invoice_item, invoice_id: invoice_2.id, item_id: 2)
  invoice_item_3 = create(:invoice_item, invoice_id: invoice_3.id, item_id: 3)
  invoice_item_4 = create(:invoice_item, invoice_id: invoice_4.id, item_id: 4)
  invoice_item_5 = create(:invoice_item, invoice_id: invoice_5.id, item_id: 5)
  invoice_item_6 = create(:invoice_item, invoice_id: invoice_6.id, item_id: 6)
  transaction_1 = create(:transaction, invoice_id: invoice_1.id)
  transaction_2 = create(:transaction, invoice_id: invoice_2.id)
  transaction_3 = create(:transaction, invoice_id: invoice_3.id)
  transaction_4 = create(:transaction, invoice_id: invoice_4.id, result: "failed")
  transaction_5 = create(:transaction, invoice_id: invoice_5.id)
  transaction_6 = create(:transaction, invoice_id: invoice_6.id)
end

context "All merchants" do
  describe "GET /api/v1/merchants/most_revenue?quantity=x" do
    it "returns the top x merchants ranked by total revenue?" do
      test_prep

      get '/api/v1/merchants/most_revenue?quantity=1'

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first["id"]).to eq(1)
    end
  end

  describe "GET /api/v1/merchants/most_items?quantity=x" do
    it "returns the top x merchants ranked by total number of items sold" do
      test_prep

      get '/api/v1/merchants/most_items?quantity=1'

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant.first["id"]).to eq(1)
    end
  end

  describe "GET /api/v1/merchants/revenue?date=x" do
    it "returns the total revenue for date x across all merchants" do
      test_prep

      get '/api/v1/merchants/revenue?date=2014-02-27+14:54:09+UTC'

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["total_revenue"]).to eq("100.0")
    end
  end
end

context "Single merchant" do
  describe "GET /api/v1/merchants/:id/revenue" do
    it "returns the total revenue for that merchant across successful transactions" do
      test_prep

      get '/api/v1/merchants/1/revenue'

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["revenue"]).to eq("110.0")
    end
  end

  describe "GET /api/v1/merchants/:id/revenue?date=x" do
    it "returns the total revenue for that merchant for a specific invoice date x" do
      test_prep

      get '/api/v1/merchants/1/revenue?date=2014-02-27+14:54:09+UTC'

      revenue = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue["revenue"]).to eq("100.0")
    end
  end

  describe "GET /api/v1/merchants/:id/favorite_customer" do
    it "returns the customer who has conducted the most total number of successful transactions" do
      test_prep

      get '/api/v1/merchants/1/favorite_customer'

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["id"]).to eq(1)
    end
  end
end

context "Items" do
  describe "GET /api/v1/items/most_revenue?quantity=x" do
    it "returns the top x items ranked by total revenue generated" do
      test_prep

      get '/api/v1/items/most_revenue?quantity=1'

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item.first["id"]).to eq(1)
    end
  end

  describe "GET /api/v1/items/most_items?quantity=x" do
    it "returns the top x item instances ranked by total number sold" do
      test_prep

      get '/api/v1/items/most_items?quantity=1'

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item.first["id"]).to eq(1)
    end
  end

  describe "GET /api/v1/items/:id/best_day" do
    it "returns the date with the most sales for the given item using the invoice date" do
      test_prep

      get '/api/v1/items/1/best_day'

      date = JSON.parse(response.body)

      expect(response).to be_success
      expect(date["best_day"]).to eq("2014-02-27T14:54:09.000Z")
    end
  end
end

context "Customers" do
  describe "GET /api/v1/customers/:id/favorite_merchant" do
    it "returns a merchant where the customer has conducted the most successful transactions" do
      test_prep

      get '/api/v1/customers/1/favorite_merchant'

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(1)
    end
  end
end