require "rails_helper"

RSpec.describe "UsersSignups", type: :request do
  describe "GET /signup" do
    it "works! (now write some real specs)" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end
end
