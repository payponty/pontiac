$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pontiac/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pontiac"
  s.version     = Pontiac::VERSION
  s.authors     = ["PayPonty"]
  s.email       = ["payponty.info@gmail.com"]
  s.homepage    = "http://payponty.github.io/pontiac/"
  s.summary     = "Gem engine for applications in the system PayPonty"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "omniauth-payponty", "~> 0.1.3"
  s.add_dependency "kitpay", "~> 0.1.1"
  s.add_dependency "haml", "~> 3.1.6"
  s.add_dependency "bootstrap-sass", "~> 2.0.4.0"
  s.add_dependency "settingslogic", "~> 2.0.8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.10.1"
  s.add_development_dependency "factory_girl_rails", "~> 3.5.0"
end
