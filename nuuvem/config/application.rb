require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nuuvem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Since we're using Redis for Sidekiq, we might as well use Redis to back
    # our cache store. This keeps our application stateless as well.
    config.cache_store = :redis_store, ENV['CACHE_URL'],
                         { namespace: 'nuuvem::cache' }

    # If you've never dealt with background workers before, this is the Rails
    # way to use them through Active Job. We just need to tell it to use Sidekiq.
    config.active_job.queue_adapter = :sidekiq

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    # config.api_only = true

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.action_view.embed_authenticity_token_in_remote_forms

    config.generators do |g|
      g.template_engine :slim
    end
  end
end
