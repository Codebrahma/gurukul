source 'https://rubygems.org'

gem 'rails', '4.1.6'

gem 'rails-api'

gem 'spring', :group => :development

## Database Adapter
gem 'mysql2'

gem 'constantizable'

# Serializer
gem "active_model_serializers"

# Elegant code
gem "monadic"

gem 'devise'

# Easy configuration
gem "figaro"

gem "parallel"

group :development, :test do
  # Debug gem
  gem 'pry', '0.9.12'

  gem "faker"
  gem "spring-commands-rspec"

  # Testing stuff
  gem 'rspec-rails', '2.13.0'
  gem 'rspec-core', '2.13.1'
  gem 'factory_girl_rails', '4.0'
  gem "factory_girl", "4.0"
  gem "factory_group", :git => "https://github.com/Codebrahma/factory_group"
end

group :test do
  # Ensure a clean state for testing.
  gem 'database_cleaner'

  # rspec easy matchers
  gem 'shoulda-matchers', '2.7.0'

  # Mock http interactions
  gem 'webmock'
end
