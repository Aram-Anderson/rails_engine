class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    render json: Merchant.most_items(search_params[:quantity].to_i)
  end

  private

  def search_params
    params.permit(:quantity)
  end
end
