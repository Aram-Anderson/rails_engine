class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index
    params[:unit_price].tr!(".", "") if params[:unit_price]
    render json: InvoiceItem.where(search_params)
  end

  def show
    params[:unit_price].tr!(".", "") if params[:unit_price]
    render json: InvoiceItem.find_by(search_params)
  end

  private

  def search_params
    params.permit(:id,
                  :quantity,
                  :item_id,
                  :invoice_id,
                  :unit_price,
                  :created_at,
                  :updated_at,
                  )
  end
end
