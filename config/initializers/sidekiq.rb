Sidekiq.configure_server do |config|
  config.redis = { url: ENV['SIDEKIQ_URL'] || 'redis://localhost' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['SIDEKIQ_URL'] || 'redis://localhost' }
end