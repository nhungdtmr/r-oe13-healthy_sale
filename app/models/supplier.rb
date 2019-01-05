class Supplier < ApplicationRecord
  has_many :imports
  has_many :products
end
