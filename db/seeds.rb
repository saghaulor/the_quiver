# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Uom.create([{unit: 'yd'}, {unit: 'm'}, {unit: 'ft'}])
User.create(last_name: 'Aghaulor', first_name: 'Stephen', email: 'saghaulor@gmail.com')
