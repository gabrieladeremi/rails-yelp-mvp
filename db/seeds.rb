# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Clearing database'
Restaurant.destroy_all
Review.destroy_all

puts 'Seeding data into the database'
5.times do
  restaurant = Restaurant.create({
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: %w[chinese italian japanese french belgian].sample
  })

  puts 'creating a restuarant'

  Review.create({
    content: Faker::Restaurant.description,
    rating: rand(1..5),
    restaurant: restaurant
  })

  puts 'creating a review'
end
