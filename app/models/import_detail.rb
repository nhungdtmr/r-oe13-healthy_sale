class ImportDetail < ApplicationRecord
  has_many :products
  belongs_to :import
end
