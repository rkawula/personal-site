source 'http://rubygems.org'

ruby '2.2.1'
gem 'haml'
gem 'less-rails', '~> 2.7.0'
gem 'rails', '4.2.3'
gem 'therubyracer'

gem 'knife-solo'

group :development, :test do
	gem 'sqlite3'
	gem 'byebug', '3.4.0'
	gem 'rspec-rails', require: false
	gem 'factory_girl_rails', require: false
	gem 'cucumber-rails', require: false
	gem 'database_cleaner'
end

group :production do
	gem 'pg', '0.17.1'
	gem 'rails_12factor','0.0.2'
end

gem 'sass'
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'coffee-script-source', '1.8.0'
gem 'coffee-script', '2.3.0'
gem 'coffee-rails', '~> 4.0.1'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
