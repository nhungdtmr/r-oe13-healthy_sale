require "rails_helper"

RSpec.describe Image, type: :model do 
  describe "db schema" do 
    context "columns" do 
      it {should have_db_column(:product_id).of_type(:integer)}
      it {should have_db_column(:url).of_type(:string)}
    end
  end
end
