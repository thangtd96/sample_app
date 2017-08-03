require "rails_helper"

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "unsuccess Signup" do
      before do
        post :create, params: {user: {name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "123123",
          password_confirmation: "321321"}}
      end

      it {expect(User.count).to eq 42}
      it {expect(response).to render_template :new}
    end

    context "Signup is success" do
      before do
        post :create, params: {user: {name: Faker::Name.name,
          email: Faker::Internet.email,
          password: "123123",
          password_confirmation: "123123"}}
      end

      it {expect(User.count).to eq 65}
      it {expect(response).to redirect_to user_path 66}
    end
  end
end
