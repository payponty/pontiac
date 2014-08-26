module Pontiac
  module Helpers
    def self.included(base)
      base.send :helper, Pontiac::ApplicationHelper
      base.send :include, Pontiac::ApplicationHelper
    end
  end
end
