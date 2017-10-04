class Api::V1::Customers::RandomController < ApplicationController
  def show
    render json: Customer.find_random
  end
end
