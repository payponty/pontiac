require "pontiac/engine"
require 'haml' 
require 'bootstrap-sass'
require 'omniauth'
require 'settingslogic'
require 'omniauth-payponty'
require 'kitpay'

module Pontiac
  autoload :Helpers, "pontiac/helpers"

  module Rails
    autoload :Routes, "pontiac/rails/routes"
  end
end
