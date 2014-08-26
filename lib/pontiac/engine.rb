module Pontiac
  class Engine < Rails::Engine
    isolate_namespace Pontiac
    engine_name 'pontiac'

    def models_dir
      root.join 'app', 'models'
    end

    config.generators do |g|                                                               
      g.template_engine :haml
      g.test_framework :rspec, :views => false
      g.integration_tool :rspec
    end

    initializer "pontiac.routes" do
      Pontiac::Rails::Routes.install
    end

    initializer "pontiac.acronym" do
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym 'Fwm'
      end
    end

    initializer "pontiac.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include Pontiac::Helpers
      end
    end

    initializer "pontiac.omniauth" do |app|
      app.middleware.use OmniAuth::Builder do
        provider :payponty,
          (SecretSetting.oauth.client_id rescue nil),
          (SecretSetting.oauth.secret rescue nil),
          :scope => (SecretSetting.oauth.scope rescue nil),
          :callback_path => (SecretSetting.oauth.callback_path rescue nil),
          :setup => lambda {|env|
            params = Rack::Utils.parse_query(env['QUERY_STRING'])
            site_url = "http://#{params['shop']}"
            env['omniauth.strategy'].options[:client_options][:site] = site_url
          }
      end

      OmniAuth.config.on_failure{|env| raise env['omniauth.error']}
    end
  end
end
