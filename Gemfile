source 'http://rubygems.org'

gem 'rails' 
gem 'sqlite3'
gem 'spree' 

gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
gem 'spree_related_products', :git => 'git://github.com/spree/spree_related_products.git', :branch => '0.60.1'
gem 'activemerchant'

group :production do
    gem 'jammit'
end

group :development do 
    gem 'active_reload'
    gem 'pry-rails'
end

group :test do 
    gem 'factory_girl', :git => 'git://github.com/thoughtbot/factory_girl.git'
    gem 'factory_girl_rails', :git => 'git://github.com/thoughtbot/factory_girl_rails.git'
    gem 'rspec'
    gem 'rspec-rails'
    gem 'faker'
    gem 'spork', '0.9.0.rc9'
end
