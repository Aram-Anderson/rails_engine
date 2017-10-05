class Api::V1::Items::QuantityController < ApplicationController
  def index
    render json: Item.most_sold(search_params[:quantity].to_i)
  end

  private

  def search_params
    params.permit(:quantity)
  end
end
