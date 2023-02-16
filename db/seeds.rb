# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

# Clear existing data
Review.destroy_all
Restaurant.destroy_all

CATEGORIES = %w[chinese italian japanese french belgian]

# Generate 10 restaurants
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  # Add 3-5 reviews for each restaurant
  rand(3..5).times do
    restaurant.reviews.create(
      content: Faker::Restaurant.review,
      rating: rand(1..5)
    )
  end
end
