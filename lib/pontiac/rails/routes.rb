module Pontiac
  module Rails
    class Routes
      module Helper
        def use_pontiac(options = {}, &block)
          options.reverse_merge! callbacks: 'pontiac/omniauth_callbacks'
          self.match 'login' => "pontiac/sessions#new"
          self.get 'callback_login' => "pontiac/sessions#payponty_login"
          self.get 'callback' => "#{options[:callbacks]}#payponty"
          self.get 'sign_out' => "pontiac/sessions#destroy"
        end
      end

      def self.install
        ActionDispatch::Routing::Mapper.send :include, Pontiac::Rails::Routes::Helper
      end
    end
  end
end
