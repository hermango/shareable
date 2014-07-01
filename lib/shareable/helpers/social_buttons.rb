require 'active_support/inflector'
require 'action_view'
require 'action_view/log_subscriber'
require 'action_view/context'
require 'shareable/helpers/tags'

module Shareable
  module Helpers
    class SocialButtons < Tag
      include ::ActionView::Context
      cattr_accessor :buttons
      self.buttons = %w[ twitter facebook pinterest reddit google_plus linkedin tumblr stumble_upon ]

      cattr_accessor :config_options
      self.config_options = {
      :facebook => [ :app_id, :send, :layout, :show_faces, :width, :action, :font, :colorscheme, :ref, :share, :kid_directed_site ],
      :google_plus => [ :annotation, :recommendations, :align, :expand_to, :callback, :onstartinteraction, :onendinteraction, :size, :width ],
      :linkedin => [ :counter, :onsuccess, :onerror, :showzero, :title, :description ],
      :pinterest => [ :pin_config, :pin_do, :title, :alt, :media, :description, :pin_shape, :pin_height, :pin_color ],
      :reddit => [ :title, :target, :color, :bordercolor, :type, :styled, :newwindow, :btnsrc, :points ],
      :stumble_upon => [ :badge_layout, :title ],
      :tumblr => [ :title, :description, :width, :background ],
      :twitter => [ :via, :text, :related, :count, :lang, :counturl, :hashtags, :size, :dnt ]}

      def initialize(template, options) #:nodoc:
        @template, @options = template, options
        @options[:buttons] ||= allowable(Shareable.config.names)
        @options[:options] ||= {}
        Shareable.config.config.each_key do |key|
          @options[:options].merge! key => (options[key].blank? ? Shareable.config.config.values_at(key).first : options[key])
        end
        # initialize @output_bugger i.v. used in ActionView::Context
        @output_buffer = ActionView::OutputBuffer.new
      end

      # render given block, view template for socialize class
      def render(&block) #:nodoc:
        instance_eval(&block)
        @output_buffer
      end

      buttons.each do |tag|
        eval <<-DEF
          def #{tag}_tag
            #{tag.split('_').collect(&:capitalize).join}.new @template, @options
          end
        DEF
      end

      def to_s #:nodoc:
        #from Kamanari for handling log subscriber:
        subscriber = ActionView::LogSubscriber.log_subscribers.detect {|ls| ls.is_a? ActionView::LogSubscriber}

        # There is a logging subscriber
        # and we don't want it to log render_partial
        # It is threadsafe, but might not repress logging
        # consistently in a high-load environment
        if subscriber
          unless defined? subscriber.render_partial_with_logging
            class << subscriber
              alias_method :render_partial_with_logging, :render_partial
              attr_accessor :render_without_logging
              # ugly hack to make a renderer where
              # we can turn logging on or off
              def render_partial(event)
                render_partial_with_logging(event) unless render_without_logging
              end
            end
          end

          subscriber.render_without_logging = true
          ret = super @options.merge :social_buttons => self
          subscriber.render_without_logging = false

          ret
        else
          super @options.merge :social_buttons => self
        end
      end

      def each_relevant_button #:nodoc:
        @options[:buttons].each do |button|
          yield button
        end
      end

      alias :each_button :each_relevant_button

      protected

      def allowable(names)
        names.select { |b| buttons.include? b }
      end
    end
  end
end
