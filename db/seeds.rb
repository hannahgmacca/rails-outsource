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

if User.count == 0
   admin = User.create!({
       :email => "company@email.com", 
       :password => "password", 
       :password_confirmation => "password", 
       :admin => true, 
       :first_name => "Hannah", 
       :surname => "McDonald", 
       :city_id => 1 })
       puts "Created #{admin.first_name} user"

   user1 = User.create!({
       :email => "user@email.com", 
       :password => "password", 
       :password_confirmation => "password", 
       :admin => false,  :first_name => "Ella", 
       :surname => "Scott", :city_id => 2  })
   puts "Created #{user1.first_name} user"

   user2 = User.create!({
       :email => "user2@email.com", 
       :password => "password", 
       :password_confirmation => "password", 
       :admin => false, 
       :first_name => "Stacey", 
       :surname => "Schwenk", 
       :city_id => 3  })
   puts "Created #{user2.first_name} user"
end

if Task.count == 0
    task1 = Task.create!({
        :title => "Walk my dog", 
        :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", 
        :price => 50, 
        :category_id => 1, 
        :user_id => "1", 
        :remote_work => false, 
        :sourced => false })
     puts "Created #{task1.title} task"

     task2 = Task.create!({
        :title => "Clean my kitchen", 
        :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", 
        :price => 25, 
        :category_id => 2, 
        :user_id => "2", 
        :remote_work => false, 
        :sourced => false })
    puts "Created #{task2.title} task"

    task3 = Task.create!({
        :title => "File my tax return", 
        :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", 
        :price => 150, 
        :category_id => 5, 
        :user_id => "3", 
        :remote_work => true, 
        :sourced => false })
    puts "Created #{task3.title} task"
end