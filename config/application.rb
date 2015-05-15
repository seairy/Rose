require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module Rose
  class Application < Rails::Application
    config.time_zone = 'London'
    config.i18n.default_locale = :en
    config.active_record.raise_in_transactional_callbacks = true
  end
end