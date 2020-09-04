require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning ingredients from the database..."

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

INGREDIENTS = ingredient['drinks']

puts "Creating ingredients ..."

INGREDIENTS.each do |ingredient|
  Ingredient.create(name: "#{ingredient["strIngredient1"]}")
end

puts "Created #{Ingredient.count} ingredients"

### cocktails seeds

puts "Cleaning cocktails from the database..."

Cocktail.destroy_all

puts "Creating cocktails ..."

negroni_file = URI.open('https://images.unsplash.com/photo-1551751299-1b51cab2694c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80')
negroni = Cocktail.new(name: "Negroni")
negroni.photo.attach(io: negroni_file, filename: 'negroni.jpg', content_type: 'image/jpg')
negroni.save!

pisco_file = URI.open('https://images.unsplash.com/photo-1558950334-8d04704332f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
pisco = Cocktail.new(name: "Pisco")
pisco.photo.attach(io: pisco_file, filename: 'pisco.jpg', content_type: 'image/jpg')
pisco.save!

sex_beach_file = URI.open('https://images.unsplash.com/photo-1568100119359-dd8eec0b1ca3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=959&q=80')
sex_on_the_beach = Cocktail.new(name: "Sex on the beach")
sex_on_the_beach.photo.attach(io: sex_beach_file, filename: 'sex_on_the_beach.jpg', content_type: 'image/jpg')
sex_on_the_beach.save!

olive_splash_file = URI.open('https://images.unsplash.com/photo-1564957468535-e8e51b0d2f56?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
olive_splash = Cocktail.new(name: "Olive splash")
olive_splash.photo.attach(io: olive_splash_file, filename: 'olive_splash.jpg', content_type: 'image/jpg')
olive_splash.save!

# Cocktail.create(name: "Mojito", photo: '../app/assets/images/mojito.jpg')

puts "Created #{Cocktail.count} cocktails"


