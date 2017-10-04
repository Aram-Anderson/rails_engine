class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: Merchant.highest_earning(search_params[:quantity].to_i)
  end

  def show
    render json: Merchant.highest_earning
  end

  private

  def search_params
    params.permit(:quantity)
  end
end
