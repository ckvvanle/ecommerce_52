class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  acts_as_paranoid

  delegate :name, :picture, :quantity, to: :product, prefix: true

  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :price, presence: true, numericality: true

  def amount
    price * quantity
  end
end
