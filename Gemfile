source 'https://rubygems.org'

gem 'rails', '4.2.1'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'

# gem 'active_model_serializers'
gem 'active_model_serializers', git: 'git@github.com:rails-api/active_model_serializers.git', branch: '0-8-stable'

gem 'devise'

gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"

gem 'compass-rails', '~> 2.0.2'

gem 'furatto'

gem 'font-awesome-rails'

gem 'simple_form'

group :development do
	gem 'sqlite3'
	gem 'byebug'
	gem 'web-console', '~> 2.0'
	gem 'spring'
end

group :development, :test do
	gem "factory_girl_rails"
	gem 'ffaker'
end

group :test do
	gem "rspec-rails"
	gem 'rspec-collection_matchers'
	gem "shoulda-matchers"
end

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', require: false
end

# group :production do
#   gem 'pg',             '0.17.1'
#   gem 'rails_12factor', '0.0.2'
# end
