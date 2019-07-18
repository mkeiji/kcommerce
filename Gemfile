source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


#*************** PROJECT SPECIFIC GEMS ***************
# dotenv
gem 'dotenv-rails'

# device (authentication gem)
gem 'devise'

# active admin
gem 'activeadmin', github: 'activeadmin'

# wysiwyg EDITOR for text box in active admin
gem 'active_admin_editor', github: 'ejholmes/active_admin_editor'

# carrierwave for image upload
gem 'carrierwave', '~> 1.0'
# mini_magick gem for carrierwave auto resize
gem 'mini_magick'

# slim-rails gem
gem 'slim-rails'

# bootstrap with autoprefixer
# autoprefixer is optional, but recommended. It automatically
# adds the proper vendor prefixes to your CSS code when it is compiled.
# # bootstrap 3.2.0 might be deprecated
# gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'autoprefixer-rails'

# some extra fonts and icons
gem 'font-awesome-rails'

# pagination gems
gem 'kaminari'
gem 'bootstrap-kaminari-views'

# formating number to money
gem 'money-rails', '~>1'

# stripe API
gem 'stripe'


#*************** PROJECT DEFAULT GEMS ***************
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# # Use postgresql as the database for Active Record
# gem 'pg', '~> 0.18'

# # Use mysql as the database for Active Record
# gem 'mysql2', '>= 0.3.18', '< 0.5'

# Use SQLITE3
gem 'sqlite3', '~> 1.3.11'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


