require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KarateSite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # gem 'npm-pipeline-rails' settings (https://github.com/rstacruz/npm-pipeline-rails)
    config.npm.enable_watch = Rails.env.development?

    # Command to install dependencies
    config.npm.install = ['npm install']

    # Command to build production assets
    config.npm.build = ['npm run build']

    # Command to start a file watcher
    config.npm.watch = ['npm run start']

    # The commands are arrays; you may add more commands as needed:
    # config.npm.watch = [
      # 'npm run webpack:start',
      # 'npm run brunch:start'
    # ]

    # If 'true', runs 'npm install' on 'rake assets:precompile' Disable to speed up,
    # but will need to run 'npm install' manually
    config.npm.install_on_asset_precompile = true

    # If 'true', runs 'npm install' on 'rails server'
    # If disabled, need to run 'npm install' manually
    config.npm.install_on_rails_server = true
  end
end
