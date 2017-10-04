class Api::V1::Transactions::RandomController < ApplicationController
  def show
    render json: Transaction.find_random
  end
end
