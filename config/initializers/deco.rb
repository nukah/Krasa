Krasaonline::Application.config.to_prepare do
  Dir.glob(File.join(Rails.root, "app/**/*_decorator.rb")) do |c|
      Rails.application.config.cache_classes ? require(c) : load(c)
  end
end