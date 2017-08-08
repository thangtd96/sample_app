require "rails_helper"
include Capybara::RSpecMatchers

RSpec.describe "StaticPage", type: :request do
  describe "GET /home" do
    it "works! (now write some real specs)" do
      get home_path
      byebug
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /help" do
    it "works! (now write some real specs)" do
      get help_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /about" do
    it "works! (now write some real specs)" do
      get help_path
      expect(response).to have_http_status(200)
    end
  end
end
