require 'rails_helper'

describe "Customers API" do
  context "GET /customers" do
    it "sends a list of customers" do
      create_list(:customer, 3)

      get '/api/v1/customers'

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq(3)
    end
  end

  context "GET /customers/:id" do
    it "sends specified customer" do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
  end

  context "GET /customers/find?parameters" do
    it "can find an customer by id" do
      customer = create(:customer)

      get "/api/v1/customers/find?id=#{customer.id}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
    it "can find an customer by first name" do
      customer = create(:customer)

      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
    it "can find an customer by last name" do
      customer = create(:customer)

      get "/api/v1/customers/find?last_name=#{customer.last_name}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
    it "can find an customer by created_at" do
      customer = create(:customer)

      get "/api/v1/customers/find?created_at=#{customer.created_at}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
    it "can find an customer by updated_at" do
      customer = create(:customer)

      get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
  end
end
