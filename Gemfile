source 'https://rubygems.org'

gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "therubyracer", ">= 0.11.3", :platform => :ruby, :require => "v8"
end

gem "haml-rails", ">= 0.4"
gem "html2haml", ">= 1.0.1", :group => :development
gem "bootstrap-sass", ">= 2.3.0.0"
gem "simple_form", ">= 2.1.0"
gem "libv8", ">= 3.11.8"
gem "hub", ">= 1.10.2", :require => nil, :group => [:development]

gem 'jquery-rails'

# Web server
gem "thin", ">= 1.5.0"

# Database (Postgres)
gem "pg", ">= 0.15.0"

# Authentication
gem "devise", ">= 2.2.3"

# File attachments
gem "carrierwave"
gem "fog"           # File uploads to the cloud

gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]

group :test do
  gem "database_cleaner", ">= 1.0.0.RC1"
  gem "email_spec", ">= 1.4.0"
end

group :development do
  gem "quiet_assets", ">= 1.0.2"
  gem "better_errors", ">= 0.7.2"
  gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx]
end

