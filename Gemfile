source 'http://rubygems.org'

gem 'rails', "3.1.1"
gem 'sqlite3'
gem 'spree', :git => 'git://github.com/spree/spree.git', :tag => 'v0.70.1'

gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
gem 'spree_related_products', :git => 'git://github.com/spree/spree_related_products.git'
gem 'spree_recently_viewed', :git => 'git://github.com/spree/spree_recently_viewed.git'
gem 'activemerchant'
gem 'locale_detector'

group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier' 
end

group :production do
    gem 'jammit'
end

group :development do 
    gem 'rails-dev-boost'
    gem 'pry-rails'
end

group :test do 
    gem 'factory_girl', :git => 'git://github.com/thoughtbot/factory_girl.git'
    gem 'factory_girl_rails', :git => 'git://github.com/thoughtbot/factory_girl_rails.git'
    gem 'rspec'
    gem 'rspec-rails'
    gem 'faker'
    gem 'spork' #, '0.9.0.rc9'
end
