class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  scope :select_categories, -> {select :id, :name}
end
