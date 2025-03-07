require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TarotreaderApi
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    # 👇 Add these lines to enable cookies and sessions in API-only mode
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_tarotreader_session'

    config.api_only = true
  end
end
