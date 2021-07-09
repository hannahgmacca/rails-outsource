# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["Cleaning", "Delivery", "Removals", "Technology", "Business & Admin", "Tutoring", "Repair", "Fern", "Home & Garden", "Design & Admin", "Misc"]
cities = ["Sydney", "Melbourne", "Perth", "Adelaide", "Brisbane", "Hobart", "Canberra", "Gold Coast", "Darwin", "Geelong", "Newcastle"]
if Category.count == 0
    categories.each do |category|
        Category.create(title: category, description: "A category")
        puts "Created #{category} category"
    end
end

if City.count == 0
    cities.each do |city|
        City.create(name: city)
        puts "Created #{city} city"
    end
end