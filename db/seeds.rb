# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

api_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

Ingredient.destroy_all

open(api_url) do |stream|
  json = JSON.parse(stream.read)
  json['drinks'].each do |drink|
    Ingredient.create(name: drink['strIngredient1'])
  end
end

Ingredient.create(name: 'Coke')
Ingredient.create(name: 'Ice')
Ingredient.create(name: 'Cachaça')
Ingredient.create(name: 'Energy Drink')
Ingredient.create(name: 'Orange Juice')