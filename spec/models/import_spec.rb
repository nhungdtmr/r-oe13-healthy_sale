require "rails_helper"

RSpec.describe Import, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:user_id).of_type(:integer)}
      it {should have_db_column(:supplier_id).of_type(:integer)}
    end
  end

  describe "associations" do 
    it {should have_many(:import_details)}
    it {should belong_to(:user)}
    it {should belong_to(:supplier)}
  end
end
