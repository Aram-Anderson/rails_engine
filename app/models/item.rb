class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope -> { order(:id) }

  def self.most_revenue(limit)
    unscoped
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order('sum(invoice_items.unit_price * invoice_items.quantity) DESC')
    .limit(limit)
  end

  def self.most_sold(limit)
    unscoped
    .select("items.*, sum(invoice_items.quantity) AS total")
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group(:id)
    .order('total DESC')
    .limit(limit)
  end
  
  def best_day
    invoices.joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .select('invoices.*, sum(invoice_items.quantity) AS bought')
    .group(:id)
    .order('bought DESC, invoices.created_at DESC')
    .first
    .created_at
  end
end
