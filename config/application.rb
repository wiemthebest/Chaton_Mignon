require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatonMignon
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    config.middleware.use Mailjet::Rack::Endpoint, '/mailjet/callback' do |params|  # using the same URL you just set in Mailjet's administration

      email = params['email'].presence || params['original_address'] # original_address is for typofix events
    
      if user = User.find_by_email(email)
        user.process_email_callback(params)
      else
        Rails.logger.fatal "[Mailjet] User not found: #{email} -- DUMP #{params.inspect}"
      end
    end
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
