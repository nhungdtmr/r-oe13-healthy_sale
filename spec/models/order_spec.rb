require "rails_helper"

RSpec.describe Order, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:receiver).of_type(:string)}
      it {should have_db_column(:user_id).of_type(:integer)}
      it {should have_db_column(:order_place).of_type(:string)}
      it {should have_db_column(:order_phone).of_type(:string)}
      it {should have_db_column(:status).of_type(:integer)}
      it {should have_db_column(:description).of_type(:string)}
    end
  end

  describe "validations" do 
    it {should validate_presence_of(:receiver)}
    it {should validate_presence_of(:order_place)}
    it {should validate_presence_of(:order_phone)}
    it {should validate_presence_of(:status)
        should define_enum_for(:status).with_values([:waitting, :stopped, :suspended])}
    it {should validate_presence_of(:description)}
  end

  describe "associations" do 
    it {should have_many(:order_details)}
    it {should belong_to(:user)}
  end
end
