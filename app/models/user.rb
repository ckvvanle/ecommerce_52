class User < ApplicationRecord
  PARAMS = [:name, :email, :password, :password_confirmation, :address, :phone]
  devise :database_authenticatable, :registerable, :rememberable,
    :validatable

  before_save{email.downcase!}

  has_many :comments, dependent: :destroy
  has_many :rattings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :suggests, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.maximum.name}
  validates :address, presence: true,
    length: {maximum: Settings.maximum.address}
  validates :phone, presence: true, length: {maximum: Settings.maximum.phone}

  enum role: {member: 0, admin: 1}

  scope :newest, ->{order created_at: :DESC}
  scope :search, ->(key) do
    where "name LIKE ? OR email LIKE ?", "%#{key}%", "%#{key}%"
  end
end
