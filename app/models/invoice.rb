class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  # def self.most_expensive(limit = 5)
  #   select("invoices.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue")
  #   .joins(:transactions, :invoice_items)
  #   .merge(Transaction.successful)
  #   .group(:id)
  #   .order('revenue DESC')
  #   .limit(limit)
  # end

end
