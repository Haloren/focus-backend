# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Weather.delete_all
Todo.delete_all
Event.delete_all

User.create(name: "Name", email: "email@email.com", password: "password")

Weather.create(zip: '93012', user_id: User.first.id)

Todo.create(item: "Todo 1", user_id: User.first.id)
Todo.create(item: "Todo 2", user_id: User.first.id)

Event.create(title: "Event 1", date:"02/01/2021", user_id: User.first.id)