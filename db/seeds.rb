# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Example User",
email: "example@railstutorial.org",
password: "foobar",
password_confirmation: "foobar",
admin: true,
activated: true,
activated_at: Time.zone.now)

99.times do |n|
name = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password,
activated: true,
activated_at: Time.zone.now)
end
unless User.exists?(email: "admin@visitor.com")
    User.create!(email: "admin@visitor.com", password: "password", admin: true
    ) 
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
visitor = Role.create!(name:"visitor")
subscriber = Role.create!(name: "subscriber")
admin = Role.create!(name: "admin")
visitor1 = User.create!(email: "hi@gmail.com", password: "whoismy1refuge?", role_id: 1)
subscriber1 = User.create!(email: "hi2@gmail.com", password: "whoismy1refuge?", role_id: 2)
admin1 = User.create!(email: "hi3@gmail.com", password: "whoismy1refuge?", role_id: 3)
Subscription.create!(level:"1", description:"1st_level")
Subscription.create!(level:"2", description:"2nd_level")
Subscription.create!(level:"3", description:"3rd_level")
Order.create!(user_id: 1, subscription_id: 1)
Box.create!(user_id: 1, order_id: 1)