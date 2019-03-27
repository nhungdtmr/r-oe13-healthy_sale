class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :quanity, presence: true
  validates :price, presence: true, numericality: {greater_than: Settings.value.minimum_price, less_than: Settings.value.maximum_price}

  delegate :name, :price, :quanity, to: :product, prefix: :product, allow_nil: true
  private

  def update_total_price
  	order.update :total_price, (total_price + product_price * quanity.to_f)
  end
end
