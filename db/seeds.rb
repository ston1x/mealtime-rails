require 'json'

puts 'Reading recipes..'
INGREDIENTS_SEPARATOR = ';'.freeze
recipes = JSON.parse(File.read('db/seeds/recipes-en.json'))

puts 'Seeding recipes..'
recipes.each do |recipe|
  Recipe.create!(
    title: recipe['title'],
    cook_time: recipe['cook_time'],
    prep_time: recipe['prep_time'],
    ingredients: recipe['ingredients'].map do |ingredient|
      ingredient.gsub(/;/, ',') # Replace semicolons with commas in order to use semicolons as separator
    end.join(INGREDIENTS_SEPARATOR),
    ratings: recipe['ratings'],
    category: recipe['category'].presence,
    author: recipe['author'].presence,
    image: recipe['image'].presence
  )
end
puts 'Done!'
