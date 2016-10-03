require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TcsWhereis
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    conference_training_center = 'in the Conference/Training Center area, upstairs, south end of building'

    config.x.conference_rooms = {
      'fill their baskets' => 'in the vendor conference area (off of reception)',
      'service selection price' => 'in the vendor conference area (off of reception)',
      'man in the desert' => 'in the vendor conference area (off of reception)',
      'air of excitement' => 'in the vendor conference area (off of reception)',
      'data central' => 'in the Information Systems area',
      '1 great = 3 good' => 'off the atrium, behind reception',
      'intuition does not come to an unprepared mind' => 'off the atrium, behind reception',
      'gumby' => "where gumby has always been located...c'mon!",
      'contain yourself' => conference_training_center,
      'we love our employees' => conference_training_center + ' (seating area in front of Contain Yourself)',
      'all eyes on elfa' => conference_training_center,
      'service = selling' => conference_training_center,
      'fun and functional' => conference_training_center,
      'communication is leadership' => 'upstairs, northwest corner, adjacent to the executive suite',
      'we sell the hard stuff' => 'up the stairs, turn right (adjacent to merchandising)',
      'blue sky' => 'up the stairs, turn right (adjacent to merchandising)',
      'repetition creates recognition' => 'upstairs, between Loss Prevention and Marketing'
    }
  end
end
