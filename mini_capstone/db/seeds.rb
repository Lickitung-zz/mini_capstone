# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

goodwill = Supplier.new(name: "Goodwill", email: "goodwill@goodwill.com", phone_number: "1-800-GOODWILL")

goodwill.save

bestbuy = Supplier.create(name: "BestBuy", email: "bestbuy@bestbuy.com", phone_number: "1-800-BESTBUY")