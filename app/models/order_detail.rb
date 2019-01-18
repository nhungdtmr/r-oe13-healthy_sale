class OrderDetail < ApplicationRecord
  has_many :products
  belongs_to :order
  validates :quanity, presence: true
  validates :price, presence: true, numericality: {greater_than: Settings.value.minimum_price, less_than: Settings.value.maximum_price}
end
