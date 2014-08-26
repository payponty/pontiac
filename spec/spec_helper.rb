#encoding: utf-8

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'


Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false
end

OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:payponty, {
  credentials: { token: "1adbb120a55a012f24e3480aa969d9a6" },
  extra: {
    raw_info: {
      shop: {
        id: 1,
        name: 'Test Store',
        domain: 'test-store.myponty.com',
        fwm_domain: 'test-store.myponty.com' } } }
} )
