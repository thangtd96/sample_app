require "rails_helper"

RSpec.feature "Users can sign in?" do
  let!(:user) {FactoryGirl.create(:user, email:Faker::Internet.email)}

  before do
    visit "/"
    click_link I18n.t("layouts.header.sign_in")
  end

  scenario "with valid credentials" do
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button I18n.t("users.new.button_1")
    expect(page).to have_content "#{user.name}"
  end

  scenario "with invalid credentials" do
    fill_in "Email", with: ""
    fill_in "Password", with: "hello"
    click_button I18n.t("users.new.button_1")
  end
end
