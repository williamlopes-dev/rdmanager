# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Currency.find_or_create_by(name: 'ARS')
Currency.find_or_create_by(name: 'BRL')
Currency.find_or_create_by(name: 'EUR')
Currency.find_or_create_by(name: 'GBP')
Currency.find_or_create_by(name: 'USD')
