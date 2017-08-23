FactoryGirl.define do
  factory :micropost do |f|
    f.user {FactoryGirl.build :user}
    f.content "very good example"
  end
end
