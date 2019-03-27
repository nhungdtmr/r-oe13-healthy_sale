require "rails_helper"

RSpec.describe UsersController, type: :controller do 
  let(:user) {
    FactoryBot.create :user
  }

  let(:user_invalid) do {
    username: "",
    email: "",
    password: "",
    dob: "",
    address: "",
    phone: ""
  }
end

  subject {user}
  describe "GET new" do 
    it "assigns a blank user to the view" do 
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do 
    context "create a new User with valid user" do 
      before {post :create, params: {user: FactoryBot.attributes_for(:user)}}
      it "create success" do 
        expect(assigns(:user)).to be_a(User)
      end
      it "redirect" do 
        expect(flash[:success]).to match(I18n.t("spec.create_success"))
        # expect(response).to redirect_to(users_path)
      end
    end
    context "create a new User with invalid user" do 
      before {post :create, params: {user: user_invalid}}
      it "create fail" do 
        expect(flash[:danger]).to match(I18n.t("spec.create_fail"))
        expect(response).to render_template :new
      end
    end
  end
end
