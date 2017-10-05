class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    render json: Merchant.highest_earning(search_params[:quantity].to_i)
  end

  def show
    render json: {"revenue" => (Merchant.revenue_for_merchant(search_params[:id]).to_f / 100).to_s}
  end

  private

  def search_params
    params.permit(:quantity,
                  :id)
  end
end
