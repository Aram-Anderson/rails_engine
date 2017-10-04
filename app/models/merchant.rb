class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def self.highest_earning(limit = 1)
    select("merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order('revenue DESC')
    .limit(limit)
  end

  def self.most_items(limit = 1)
    select("merchants.*, sum(invoice_items.quantity) AS items_sold")
    .joins(invoices: [:invoice_items, :transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order('items_sold DESC')
    .limit(limit)
  end
end
