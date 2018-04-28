require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ec
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 587,
    dormain: 'gmail.com',
    user_name: 'postmaster@sandboxec53c097d53a4b90b5a41188660a5808.mailgun.org',
    password: '6e4c0abbc132002bc5545493238a0ae4-bdd08c82-505f1415',
    authentication: 'plain',
    enable_starttls_auto: true
  }
  end
end
