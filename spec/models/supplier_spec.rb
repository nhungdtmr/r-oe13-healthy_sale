require "rails_helper"

RSpec.describe Supplier, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:address).of_type(:string)}
      it {should have_db_column(:phone).of_type(:string)}
    end
  end
  describe "validations" do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:phone)}
  end

  describe "associations" do 
    it {should have_many(:imports)}
    it {should have_many(:products)}
    it {should have_many(:supplier_products)}
  end
end
