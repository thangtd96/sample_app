FactoryGirl.define do
  factory :user do |f|
    name {Faker::Name.name}
    email {Faker::Internet.email}
    f.password "123123"
    f.password_confirmation "123123"

  end
end
