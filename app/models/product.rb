class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :category
  has_many :supplier_products
  has_many :suppliers, through: :supplier_products
  accepts_nested_attributes_for :images, allow_destroy: true

  scope :order_by, -> {order created_at: :desc}
  scope :select_products, -> {select :name, :manufacture, :net_weight, :price, :description}
end
