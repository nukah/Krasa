Krasaonline::Application.configure do
  config.cache_classes = false
  config.whiny_nils = true
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_support.deprecation = :log
  config.action_dispatch.best_standards_support = :builtin
  
  config.assets.css_compressor = :scss
  config.assets.compress = false
  config.assets.debug = true
  config.log_level = :debug
end

