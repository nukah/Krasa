if Spree::Config.instance
  Spree::Config.set :stylesheets => 'screen,additional'
  Spree::Config.set :default_locale => 'ru-RU'
end