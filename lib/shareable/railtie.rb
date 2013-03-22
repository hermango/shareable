module Shareable
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'shareable' do |_app|
      Shareable::Hooks.init
    end
  end
end
