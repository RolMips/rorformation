require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rorformation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"

    # Do not generate helpers file
    config.generators.helper = false
    # Do not generate asset css file
    config.generators.assets = false
    #Defined default host mailer
    config.action_mailer.default_url_options = {host: 'http://localhost:3000'}

    ActionView::Base.field_error_proc = proc do |html_tag, instance|
      html_tag.gsub("form-control", "form-control is-invalid").html_safe

    end
  end
end
