class Api::V1::Merchants::DateController < ApplicationController
  def index
    render json: {"total_revenue" => (Merchant.revenue_on_date(search_params[:date]).to_f / 100).to_s}
  end

  private

  def search_params
    params.permit(:date)
  end
end
