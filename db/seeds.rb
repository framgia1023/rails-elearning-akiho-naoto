# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

User.create!(
	name: "Akiho Kurata",
	email: "akiho.kurata922@gmail.com",
	password: "1234",
	password_confirmation: "1234",
	admin: true
	)

User.create!(
	name: "Naoto Seki",
	email: "sekinyam@gmail.com",
	password: "1234",
	password_confirmation: "1234",
	admin: true
	)


10.times do |n|
		User.create!(
		name: Faker::Pokemon.name,
		email: Faker::Internet.unique.email,
		password: "1234"
	)
end


