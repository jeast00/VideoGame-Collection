# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Game.destroy_all
Genre.destroy_all

# 10.times do 
#     User.create(name:Faker::Name.name,
#                 email:Faker::Internet.email,
#                 password:Faker::Internet.password)
# end

50.times do
    Genre.create(genre_type:Faker::Game.genre)
end

100.times do
    Game.create(title:Faker::Game.title,
                platform:Faker::Game.platform)
end

