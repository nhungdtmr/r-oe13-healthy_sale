require "rails_helper"

RSpec.describe Category, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:description).of_type(:string)}
    end
  end

  describe "validations" do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
  end

  describe "association" do 
    it {should have_many(:products)}
  end
end
