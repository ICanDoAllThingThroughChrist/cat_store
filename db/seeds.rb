# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
#11-12-18:question about how to hash password? 
#answer: call has secure password in user.rb https://www.railstutorial.org/book/basic_login