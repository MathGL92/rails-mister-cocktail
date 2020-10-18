require 'json'
require 'open-uri'

puts "Cleaning cocktails from the database..."

Cocktail.destroy_all

puts "Cleaning ingredients from the database..."

Ingredient.destroy_all

puts "Cleaning users from the database..."

User.destroy_all

puts "Creating 3 users ..."

admin = User.create!(email: "admin@admin.com", password: "password", username: "Mathieu")
user1 = User.create!(email: "user@user1.com", password: "password", username: "Brad")
user2 = User.create!(email: "user@user2.com", password: "password", username: "Mary")

puts "Created #{User.count} users ..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)

INGREDIENTS = ingredient['drinks']

puts "Creating ingredients ..."

INGREDIENTS.each do |ingredient|
  Ingredient.create(name: "#{ingredient["strIngredient1"]}")
end

Ingredient.create!(name: "Campari")
Ingredient.create!(name: "Orange peels")
Ingredient.create!(name: "Egg white")
Ingredient.create!(name: "Angostura bitters")
Ingredient.create!(name: "Olive Brine")
Ingredient.create!(name: "Minth")
Ingredient.create!(name: "Soda Water")

puts "Created #{Ingredient.count} ingredients"

### cocktails seeds

puts "Creating cocktails ..."

negroni_file = URI.open('https://images.unsplash.com/photo-1551751299-1b51cab2694c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
negroni = Cocktail.new(name: "Negroni", user_id: admin.id)
negroni.photo.attach(io: negroni_file, filename: 'negroni.jpg', content_type: 'image/jpg')
negroni.save!

pisco_file = URI.open('https://images.unsplash.com/photo-1558950334-8d04704332f8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
pisco = Cocktail.new(name: "Pisco", user_id: admin.id)
pisco.photo.attach(io: pisco_file, filename: 'pisco.jpg', content_type: 'image/jpg')
pisco.save!

sex_beach_file = URI.open('https://images.unsplash.com/photo-1568100119359-dd8eec0b1ca3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
sex_on_the_beach = Cocktail.new(name: "Sex on the beach", user_id: admin.id)
sex_on_the_beach.photo.attach(io: sex_beach_file, filename: 'sex_on_the_beach.jpg', content_type: 'image/jpg')
sex_on_the_beach.save!

olive_splash_file = URI.open('https://images.unsplash.com/photo-1564957468535-e8e51b0d2f56?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
olive_splash = Cocktail.new(name: "Olive splash", user_id: admin.id)
olive_splash.photo.attach(io: olive_splash_file, filename: 'olive_splash.jpg', content_type: 'image/jpg')
olive_splash.save!

mushroom_cocktail_file = URI.open('https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
mushroom_cocktail = Cocktail.new(name: "Mushroom Cocktail", user_id: admin.id)
mushroom_cocktail.photo.attach(io: mushroom_cocktail_file, filename: 'mushroom_cocktail.jpg', content_type: 'image/jpg')
mushroom_cocktail.save!

moscow_mule_file = URI.open('https://images.unsplash.com/photo-1530991808291-7e157454758c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
moscow_mule = Cocktail.new(name: "Moscow mule", user_id: admin.id)
moscow_mule.photo.attach(io: moscow_mule_file, filename: 'moscow_mule.jpg', content_type: 'image/jpg')
moscow_mule.save!

cosmopolitan_file = URI.open('https://images.unsplash.com/photo-1559280247-8fa41750ca29?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80')
cosmopolitan = Cocktail.new(name: "Cosmopolitan", user_id: admin.id)
cosmopolitan.photo.attach(io: cosmopolitan_file, filename: 'cosmopolitan.jpg', content_type: 'image/jpg')
cosmopolitan.save!

puts "Created #{Cocktail.count} cocktails"

puts "Creating reviews ..."

Review.create!(content: "Love this one!!!", rating: 5, user_id: user1.id, cocktail_id: negroni.id)
Review.create!(content: "Good but a bit strong for me", rating: 3, user_id: user2.id, cocktail_id: negroni.id)
Review.create!(content: "My favorite!!", rating: 3, user_id: user2.id, cocktail_id: cosmopolitan.id)
Review.create!(content: "Very original cocktail, a but surprising", rating: 4, user_id: user1.id, cocktail_id: mushroom_cocktail.id)
Review.create!(content: "Reminds me my trip in South America...", rating: 5, user_id: user1.id, cocktail_id: pisco.id)
Review.create!(content: "Very nice summer drink, a bit sweet though", rating: 4, user_id: user2.id, cocktail_id: sex_on_the_beach.id)
Review.create!(content: "Doesn't taste enough olive but ok", rating: 3, user_id: user1.id, cocktail_id: olive_splash.id)
Review.create!(content: "Good to start party!!", rating: 4, user_id: user1.id, cocktail_id: moscow_mule.id)

puts "Created #{Review.count} reviews"
