require "rails_helper"

RSpec.describe SupplierProduct, type: :model do 
  describe "associations" do 
    it {should belong_to(:product)}
    it {should belong_to(:supplier)}
  end
end
