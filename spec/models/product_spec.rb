require "rails_helper"

RSpec.describe Product, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:manufacture).of_type(:string)}
      it {should have_db_column(:net_weight).of_type(:string)}
      it {should have_db_column(:price).of_type(:float)}
      it {should have_db_column(:description).of_type(:string)}
      it {should have_db_column(:category_id).of_type(:integer)}
    end
  end

  describe "validations" do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:manufacture)}
    it {should validate_presence_of(:net_weight)}
    it {should validate_presence_of(:price)
        should validate_numericality_of(:price).is_greater_than(Settings.value.minimum_price).is_less_than(Settings.value.maximum_price)}
    it {should validate_presence_of(:description)}
  end

  describe "associations" do 
    it {should have_many(:images)}
    it {should have_many(:supplier_products)}
    it {should have_many(:suppliers)}
    it {should belong_to(:category)}
  end
end
