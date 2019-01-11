class Supplier < ApplicationRecord
  has_many :imports
  has_many :products, through: :supplier_products
  has_many :supplier_products

  scope :select_suppliers, -> {select :id, :name}
end
