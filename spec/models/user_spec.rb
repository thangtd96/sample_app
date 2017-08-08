require "rails_helper"
RSpec.describe User, type: :model do
  describe "has a valid factory" do
    before do
      @sample_user = FactoryGirl.build :user
    end
    it "factory valid" do
      expect(@sample_user).to be_valid
    end
  end

  describe "validations" do
    before do
      @sample_user = FactoryGirl.build :user
    end

    it {should validate_length_of(:name).is_at_most(50)}
    it {should validate_presence_of :email}
    it {should validate_length_of(:email).is_at_most(255)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of :password}
    it {should validate_presence_of :password_confirmation}
    it {should validate_length_of(:password).is_at_least(6)}
    it {should validate_length_of(:password_confirmation).is_at_least(6)}

    it "valid if name is blank?" do
      @sample_user.name = nil
      expect(@sample_user).to_not be_valid
    end
  end
end
