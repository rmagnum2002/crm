source 'https://rubygems.org'

gem 'rails', '~> 3.2.13'

gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem 'jquery-ui-rails'
end

gem 'jquery-rails'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
gem 'best_in_place'
gem 'devise'
gem 'will_paginate'
gem 'activeadmin'
gem 'awesome_nested_fields'
gem "ransack"
gem 'client_side_validations'
gem 'tinymce-rails'
gem 'tinymce-rails-langs'

gem 'thin'
gem "cancan"

gem 'morrisjs-rails'
gem 'raphael-rails'
gem 'hashie' # for aplication config parameters

gem 'paper_trail'
# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'


group :development do
  gem "bullet"
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'database_cleaner'
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem 'shoulda'
  gem 'shoulda-matchers'
end
