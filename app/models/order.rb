class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  delegate :name, to: :user, prefix: true

  validates :receiver_name, presence: true,
   length: {maximum: Settings.maximum.name}
  validates :receiver_address, presence: true,
   length: {maximum: Settings.maximum.address}
  validates :receiver_phone, presence: true,
   length: {maximum: Settings.maximum.phone}
  validates :user_id, presence: true
  validates :total_price, presence: true

  enum status: {pending: 0, accepted: 1, rejected: 2}

  scope :newest, ->{order created_at: :desc}

  def caculate_tax tax_percent
    (total_price * tax_percent) / 100
  end

  def invoice_total tax_percent
    total_price + caculate_tax(tax_percent)
  end
end
