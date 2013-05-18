# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

user = User.find_or_create_by_email! name: "Admin", :email => 'admin@test.com', :password => 'testtest', :password_confirmation => 'testtest'

# Create customer
user2 = User.find_or_create_by_email! name: "Ted", :email => 'ted@test.com', :password => 'testtest', :password_confirmation => 'testtest'

vendor = Vendor.create(description: "The strongest coffee on earth", name: "Mega Coffee Shop", user: User.first)

image = File.open( File.expand_path('db/fixtures/coffee.jpg', Rails.root) )
offer = vendor.offers.create(image: image, name: "The mega Cup", description: "The biggest cup of coffee in the world")