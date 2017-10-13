# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "admin@example.com", password: "password", role: :admin, home_address: "home address", work_address: "work address", approved: true)
User.create(email: "operator@example.com", password: "password", role: :operator, home_address: "home address", work_address: "work address", approved: true)
