class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    if params[:date]
      render json: {"revenue" => (Merchant.revenue_for_merchant_date(params[:id], params[:date]).to_f / 100).to_s}
    else
      render json: {"revenue" => (Merchant.revenue_for_merchant(params[:id]).to_f / 100).to_s}
    end
  end
end
