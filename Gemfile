source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'compass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'materialize-sass'


gem 'jquery-rails'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'bcrypt', '~> 3.1.7'

gem 'omniauth'
gem 'omniauth-github'
gem 'figaro'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'rack_session_access'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'simplecov', :require => false, :group => :test
  gem 'webmock'
  gem 'vcr'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
