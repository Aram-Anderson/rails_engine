class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant.joins(invoices: :transactions)
    .merge(Transaction.successful)
    .where(invoices: {customer_id: id})
    .group('merchants.id')
    .order('count(merchants.id) DESC')
    .first
  end
end
