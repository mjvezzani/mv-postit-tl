# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([{title: "Title 3", description: "Description 3", url: "www.title3.com", user_id: 1}, {title: "Title 4", description: "Description 4", url: "www.title4.com", user_id: 3}, {title: "Title 5", description: "Description 5", url: "www.title5.com", user_id: 2}, {title: "Title 6", description: "Description 6", url: "www.title6.com", user_id: 1}])

Category.create([{name: "news"}, {name: "politics"}, {name: "sports"}])

User.create([{username: "sarahj"}, {username: "jimmyj"}])
