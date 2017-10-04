class Api::V1::Invoices::RandomController < ApplicationController
  def show
    render json: Invoice.find_random
  end
end
