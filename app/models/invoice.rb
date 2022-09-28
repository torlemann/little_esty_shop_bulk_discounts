class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants

  enum status: [:cancelled, 'in progress', :complete]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def discount_amount
    invoice_items.joins(:bulk_discounts)
    .where('invoice_items.quantity >= bulk_discounts.quantity_threshold')
    .select('max(invoice_items.unit_price * invoice_items.quantity * (bulk_discounts.percentage_discount / 100.0))')
    .group('invoice_items.id').sum(&:max)
  end

  def discounted_revenue
    total_revenue - discount_amount
  end
end
