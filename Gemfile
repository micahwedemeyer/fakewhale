source 'https://rubygems.org'

gem 'rails', '3.2.0'

gem 'jquery-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg', '0.13.1'
end

group :development, :test do
  gem 'backbone-on-rails', '~> 0.9.2'
  gem 'mysql2'
  gem 'sqlite3'
end

group :test do
  gem 'factory_girl_rails', '3.5.0'
  gem 'rspec-rails', '2.8.1'
end

