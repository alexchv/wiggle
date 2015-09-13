require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)
Bundler.require(:default, Rails.env)

Dir[File.expand_path('../extensions/**/*.rb', __FILE__)].sort.each { |f| require f }

module Wiggle
  class Application < Rails::Application
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.eager_load_paths += Dir["#{config.root}/app/models/seed_models/**/"]
    config.autoload_paths   += Dir["#{config.root}/app/models/seed_models/**/"]

    config.autoload_paths   += Dir["#{config.root}/lib/**/"]
    config.autoload_paths   += Dir["#{config.root}/services/**/"]

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :jp and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # config.i18n.default_locale = :en
    # I18n.enforce_available_locales = false

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins 'http://wiggleditor.herokuapp.com'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end

      allow do
        origins '*'
        resource '/animate/*', :headers => :any, :methods => :get
      end
    end

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.digest = true

    config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts', 'bower_components')

    # Precompile additional assets
    config.assets.precompile += %w(
      *.png *.jpg *.jpeg *.gif
      application.js
      application.css
      landing_application.css
    )

    config.generators do |g|
      g.test_framework = :rspec
      g.integration_tool = :rspec
      g.helper = true
      g.assets = false
      g.stylesheets = false
    end

    config.exceptions_app = self.routes

    console do
      ActiveRecord::Base.connection
    end

  end
end
