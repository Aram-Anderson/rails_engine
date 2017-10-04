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
    it "can find a customer by id" do
      customer = create(:customer)

      get "/api/v1/customers/find?id=#{customer.id}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end

    it "can find a customer by first name" do
      customer = create(:customer)

      get "/api/v1/customers/find?first_name=#{customer.first_name}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end

    it "can find a customer by last name" do
      customer = create(:customer)

      get "/api/v1/customers/find?last_name=#{customer.last_name}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end

    it "can find a customer by created_at" do
      customer = create(:customer)

      get "/api/v1/customers/find?created_at=#{customer.created_at}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end

    it "can find a customer by updated_at" do
      customer = create(:customer)

      get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

      customer_response = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_response["id"]).to eq(customer.id)
      expect(customer_response["first_name"]).to eq(customer.first_name)
      expect(customer_response["last_name"]).to eq(customer.last_name)
    end
  end

  context "GET /customers/find_all?parameters" do
    it "can find all customers by first_name" do
      customer_1 = create(:customer, first_name: 1)
      customer_2 = create(:customer, first_name: 1)
      customer_3 = create(:customer, first_name: 2)

      get "/api/v1/customers/find_all?first_name=#{customer_1.first_name}"

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(2)
      expect(customers.first["id"]).to eq(customer_1.id)
    end

    it "can find all customers by last_name" do
      customer_1 = create(:customer, last_name: 1)
      customer_2 = create(:customer, last_name: 1)
      customer_3 = create(:customer, last_name: 2)

      get "/api/v1/customers/find_all?last_name=#{customer_1.last_name}"

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(2)
      expect(customers.first["id"]).to eq(customer_1.id)
    end

    it "can find all customers by created_at" do
      customer_1 = create(:customer, created_at: "2017-10-03 20:20:20")
      customer_2 = create(:customer, created_at: "2017-10-03 20:20:20")
      customer_3 = create(:customer, created_at: "2017-05-02 21:21:21")

      get "/api/v1/customers/find_all?created_at=#{customer_1.created_at.to_s}"

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(2)
      expect(customers.first["id"]).to eq(customer_1.id)
    end

    it "can find all customers by updated_at" do
      customer_1 = create(:customer, updated_at: "2017-10-03 20:20:20")
      customer_2 = create(:customer, updated_at: "2017-10-03 20:20:20")
      customer_3 = create(:customer, updated_at: "2017-10-03 21:21:21")

      get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at.to_s}"

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(2)
      expect(customers.first["id"]).to eq(customer_1.id)
    end
  end
end
