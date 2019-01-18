class ImportDetail < ApplicationRecord
  has_many :products
  belongs_to :import
  validates :price, presence: true, numericality: {greater_than: Settings.value.minimum_price, less_than: Settings.value.maximum_price}
  validates :quanity, presence: true
end
