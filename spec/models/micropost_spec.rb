require "rails_helper"

RSpec.describe Micropost, type: :model do

  describe "has a valid factory" do
    before do
      @post = FactoryGirl.build :micropost
    end
    it "factory valid" do
      expect(@post).to be_valid
    end
  end

  describe "validations" do
    before do
      @post = FactoryGirl.build :micropost
    end

    it {should validate_length_of(:content).is_at_most(255)}
     it {should validate_presence_of :user}
  end

  describe "order should be most recent first" do
    before do
      @user = FactoryGirl.build :user
    end

    it {expect(Micropost.first).to eq @user.microposts.first}
  end

  describe "associated microposts should be destroyed" do
    before do
      @user = FactoryGirl.build :user
    end

    it do
      @user.microposts.build content: "very good"
      expect(Micropost.count).not_to eq -1
      @user.destroy
      expect(Micropost.count).to eq 0
    end
  end
end
