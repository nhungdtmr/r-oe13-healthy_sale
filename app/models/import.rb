class Import < ApplicationRecord
  has_many :import_details
  belongs_to :supplier
  belongs_to :user
end
