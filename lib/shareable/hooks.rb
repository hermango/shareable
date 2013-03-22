module Shareable
  class Hooks
    def self.init
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, Shareable::ActionViewExtension
      end
    end
  end
end
