class Order < ApplicationRecord
  has_many :order_details
  belongs_to :user
  validates :receiver, presence: true
  validates :order_place, presence: true
  validates :order_phone, presence: true
  validates :status, presence: true
  validates :description, presence: true
  enum status: %i(waitting stopped suspended)
end
