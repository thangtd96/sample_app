require "rails_helper"

RSpec.describe "UsersEdit", type: :request do
  describe "GET /users" do
    context "unsuccessful edit" do
      let :user {FactoryGirl.create :user}
      it do
        get "/users/#{user.id}/edit"
        expect(response).to render_template :edit

        patch user_path, params: {user: {name:  "tdt", email: "user@gmail.com", password: "123123", password_confirmation: "1231233"}}
        expect(response).to render_template :edit
      end
    end
  end

end
