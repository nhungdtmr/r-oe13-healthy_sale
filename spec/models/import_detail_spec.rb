require "rails_helper"

RSpec.describe ImportDetail, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:import_id).of_type(:integer)}
      it {should have_db_column(:product_id).of_type(:integer)}
      it {should have_db_column(:quanity).of_type(:integer)}
      it {should have_db_column(:price).of_type(:float)}
    end 
  end

  describe "validations" do 
    it {should validate_presence_of(:quanity)}
    it {should validate_presence_of(:price)
        should validate_numericality_of(:price).is_greater_than(Settings.value.minimum_price).is_less_than(Settings.value.maximum_price)}
  end

  describe "association" do 
    it {should belong_to(:import)}
  end
end
