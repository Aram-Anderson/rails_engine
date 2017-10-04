class Api::V1::Items::RandomController < ApplicationController
  def show
    render json: Item.find_random
  end
end
