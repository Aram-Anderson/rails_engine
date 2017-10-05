class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope -> { order(:id) }

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
