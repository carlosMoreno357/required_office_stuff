# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([
    {category_name: "stationary supplies", colour:"#273043"},
    {category_name: "computer cleaning supplies", colour:"#F02D3A"},
    {category_name: "general cleaning supplies", colour:"#498467"},
    {category_name: "bathroom cleaning supplies", colour:"#592941"},
])

user = User.create([
    {email: 'admin@stuff.com', password:'abcd1234', admin:true}
])
