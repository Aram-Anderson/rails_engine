class Api::V1::Merchants::UnpaidController < ApplicationController
  def show
    render json: Merchant.find(search_params[:id]).unpaid_customers
  end

  private

  def search_params
    params.permit(:id)
  end
end
