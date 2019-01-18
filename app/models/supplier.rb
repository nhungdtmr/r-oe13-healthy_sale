class Supplier < ApplicationRecord
  has_many :imports
  has_many :products, through: :supplier_products
  has_many :supplier_products
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  scope :select_suppliers, -> {select :id, :name}
end
