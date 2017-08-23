User.create! name: "Admin",
             email: "admin@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1,
             activated: true,
             activated_at: Time.zone.now

30.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "123123"
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 0,
               activated: true,
               activated_at: Time.zone.now
end

users = User.order(:created_at).take 6
15.times do
  content = Faker::Lorem.sentence 5
  users.each{|user| user.microposts.create! content: content}
end
