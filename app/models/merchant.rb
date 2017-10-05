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

  def self.revenue_on_date(date)
    joins(invoices: [:invoice_items, :transactions])
    .where("invoices.created_at = ?", date)
    .merge(Transaction.successful)
    .sum("quantity * unit_price")
  end

  def self.revenue_for_merchant(id)
    joins(invoices: [:invoice_items, :transactions])
    .where(id: id)
    .merge(Transaction.successful)
    .sum("quantity * unit_price")
  end

  def favorite_customer
    Customer.joins(:transactions)
    .merge(Transaction.successful)
    .where(invoices: {merchant_id: id})
    .group('customers.id')
    .order("count(customers.id) DESC")
    .first
  end
end
