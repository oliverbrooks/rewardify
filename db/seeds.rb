# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :email => 'ted@test.com', :password => 'tedtest', :password_confirmation => 'tedtest'


vendor = Vendor.create(description: "The strongest coffee on earth", name: "Mega Coffee", user: User.first)

