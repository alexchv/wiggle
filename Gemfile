source 'https://rubygems.org'

ruby '2.2.2'

# Rails 4.2.3 stack
gem 'rails', '4.2.3'                                       # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sass-rails', '~> 4.0.3'                               # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                                 # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'                             # Use CoffeeScript for .js.coffee assets and views
gem 'jquery-rails'                                         # Use jquery as the JavaScript library
gem 'turbolinks'                                           # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'                                   # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# Custom Gems
gem 'pg'                                                   # Use postgresql as the database for Active Record
gem 'puma'                                                 # Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications. Puma is intended for use in both development and production environments. In order to get the best throughput, it is highly recommended that you use a Ruby implementation with real threads like Rubinius or JRuby.
gem 'bootstrap-sass'                                       # Twitter's Bootstrap, converted to Sass and ready to drop into Rails or Compass
gem 'autoprefixer-rails'                                   # Parse CSS and add vendor prefixes to CSS rules using values from the Can I Use website.
gem 'haml-rails'                                           # Haml-rails provides Haml generators for Rails 3. It also enables Haml as the templating engine for you, so you don't have to screw around in your own application.rb when your Gemfile already clearly indicated what templating engine you have installed. Hurrah.
gem 'bower-rails'                                          # Bower support for Rails projects.
gem 'simple_form'                                          # Forms made easy!
gem 'devise'                                               # Flexible authentication solution for Rails with Warden
gem 'inherited_resources'                                  # Inherited Resources speeds up development by making your controllers inherit all restful actions so you just have to focus on what is important.
gem 'omniauth-google-oauth2'                               # Strategy to authenticate with Google via OAuth2 in OmniAuth.
gem 'cancancan'                                            # Continuation of the simple authorization solution for Rails which is decoupled from user roles. All permissions are stored in a single location.
# gem 'carrierwave'                                          # Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends.
gem 'kaminari'                                             # Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 3+
gem 'wicked'                                               # Use wicked to make your Rails controllers into step-by-step wizards.
gem 'ejs'                                                  # Compile and evaluate EJS (Embedded JavaScript) templates from Ruby.
gem 'andand'                                               # Maybe Monad in idiomatic Ruby.
gem 'paper_trail'                                          # Track changes to your models' data. Good for auditing or versioning.
gem 'rails_admin'                                          # RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data.
gem 'email_validator'                                      # An email validator for Rails 3+. See homepage for details: http://github.com/balexand/email_validator
# gem 'validate_url'                                         # This gem adds the capability of validating URLs to ActiveRecord and ActiveModel (Rails 3).
gem 'responders'                                           # A set of responders modules to dry up your Rails 3.2+ app.
gem 'gon'                                                  # If you need to send some data to your js files and you don't want to do this with long way through views and parsing - use this force!
gem 'faker'                                                # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
gem 'factory_girl_rails'                                   # factory_girl_rails provides integration between factory_girl and rails 3 (currently just automatic factory definition loading)
gem 'browser-timezone-rails'                               # The browser timezone is set on the Time#zone
gem 'nprogress-rails'                                      # This is a gem for the rstacruz' nprogress implementation.
gem 'with_advisory_lock'                                   # An advisory lock is a mutex used to ensure no two processes run some process at the same time.
gem 'firebase'                                             # Ruby wrapper for the Firebase REST API.
gem 'nokogiri'
gem 'rack-cors'

group :staging, :production do
  gem 'rails_12factor'                                     # Makes running your Rails app easier. Based on the ideas behind 12factor.net
end

group :development do
  gem 'better_errors'                                      # Provides a better error page for Rails and other Rack apps. Includes source code inspection, a live REPL and local/instance variable inspection for all stack frames.
  gem 'quiet_assets'                                       # Quiet assets turn off rails assets log.
  gem 'rails_best_practices'                               # A code metric tool for rails codes, written in Ruby
  gem 'jazz_hands',
      :github => 'nixme/jazz_hands',
      :branch => 'bring-your-own-debugger'                 # Spending hours in the rails console? Spruce it up and show off those hard-working hands! jazz_hands replaces IRB with Pry, improves output through awesome_print, and has some other goodies up its sleeves.
  gem 'pry-nav'                                            # Teaches Pry about step, next, and continue to create a simple debugger.
  # gem 'rack-mini-profiler'                                 # Middleware that displays speed badge for every html page. Designed to work both in production and in development.
end

group :test do
  gem 'rspec-rails'                                        # RSpec for Rails
  gem 'shoulda-matchers'                                   # Making tests easy on the fingers and eyes
  gem 'guard-rspec'                                        # Guard::RSpec automatically run your specs (much like autotest).
  gem 'json_spec'                                          # RSpec matchers and Cucumber steps for testing JSON content
  gem 'webrat'                                             # Webrat lets you quickly write expressive and robust acceptance tests for a Ruby web application. It supports simulating a browser inside a Ruby process to avoid the performance hit and browser dependency of Selenium or Watir, but the same API can also be used to drive real Selenium tests when necessary (eg. for testing AJAX interactions). Most Ruby web frameworks and testing frameworks are supported.
  gem 'capybara'                                           # Capybara is an integration testing tool for rack based web applications. It simulates how a user would interact with a website
end
