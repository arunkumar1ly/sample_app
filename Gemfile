source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'bootstrap-sass', '2.1' # The Bootstrap framework natively uses the LESS CSS language for making dynamic stylesheets, but the Rails asset pipeline supports the (very similar) Sass language by default (Section 5.2), so bootstrap-sass converts LESS to Sass and makes all the necessary Bootstrap files available to the current application
gem 'bcrypt-ruby', '3.0.1' # to irreversibly encrypt the password to form the password hash.
gem 'faker', '1.0.1'  # will allow us to make sample users with semi-realistic names and email addresses
gem 'will_paginate', '3.0.3' #There are several pagination methods in Rails; we’ll use one of the simplest and most robust, called will_paginate.
gem 'bootstrap-will_paginate', '0.0.6' # configures will_paginate to use Bootstrap’s pagination styles

group :development, :test do
  gem 'sqlite3', '1.3.5' #SQLite db gem
  gem 'rspec-rails', '2.11.0' #the gem for RSpec library specific to Rails, We don’t have to install RSpec itself because it is a dependency of rspec-rails 
  gem 'guard-rspec', '1.2.1' # Automated tests with Guard
  gem 'spork', '0.9.2'
end

group :development do
  gem 'annotate', '2.5.0' # Model Annotatetion
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'     # the gem for the RSpec,which allows us to simulate a user’s interaction with the sample application using a natural English-like syntax
  gem 'rb-inotify', '0.8.8' #system-dependent gems to run automated test
  gem 'libnotify', '0.5.9' #system-dependent gems to run automated test
  gem 'factory_girl_rails', '4.1.0'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'  # utility gem for cucumber
end
group :production do
  gem 'pg', '0.12.2' #PostgreSQL gem
end