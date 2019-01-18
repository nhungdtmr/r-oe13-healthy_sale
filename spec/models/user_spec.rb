require "rails_helper"

RSpec.describe User, type: :model do 
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:email).of_type(:string)}
      it {should have_db_column(:password).of_type(:string)}
      it {should have_db_column(:dob).of_type(:datetime)}
      it {should have_db_column(:address).of_type(:string)}
      it {should have_db_column(:phone).of_type(:string)}
      it {should have_db_column(:role).of_type(:integer)}
    end
  end

  describe "validations" do
    it {should validate_presence_of(:username)
        should validate_length_of(:username).is_at_most(Settings.value.maximum_name)}
    it {should validate_presence_of(:email)
        should validate_length_of(:email).is_at_most(Settings.value.maximum_email)}
    it {should validate_presence_of(:password)
        should validate_length_of(:password).is_at_least(Settings.value.minimum_password).is_at_most(Settings.value.maximum_password)}
    it {should validate_presence_of(:dob)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:role)}
  end

  describe "association" do 
    it {should have_many(:orders)}
    it {should have_many(:imports)}
  end

  describe "instance methods" do
    it {should respond_to(:remember)}
  end
end
