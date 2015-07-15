source 'http://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.2.2'

gem 'pg'

# Controller related
gem 'responders'
gem 'gibbon'

# Views and assets
gem 'foundation-rails'
gem 'slim'
gem 'slim-rails'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'simple_form'
gem 'jbuilder'
gem 'underscore-rails'
gem 'underscore-string-rails'
gem 'font-awesome-rails'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'master'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # Workers, forks and all that jazz
  gem 'unicorn'
  # Enabling Gzip on Heroku
  # If you don't use Heroku, please comment the line below.
  gem 'heroku-deflater', '>= 0.4.1'
  gem 'rails_12factor'
  gem 'rack-timeout'
end
