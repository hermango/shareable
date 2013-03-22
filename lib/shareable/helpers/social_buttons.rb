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
      self.buttons = %w[ twitter facebook pinterest reddit google_plus linkedin ]

      #not very DRY. Refactor.
      cattr_accessor :config_options
      self.config_options = {
      :facebook => [ :app_id, :send, :layout, :show_faces, :width, :action, :font, :colorscheme, :ref ],
      :google_plus => [ :annotation, :recommendations, :align, :expand_to, :callback, :onstartinteraction, :onendinteraction, :size, :width ],
      :linkedin => [ :counter, :onsuccess, :onerror, :showzero ],
      :pinterest => [ :pin_config, :pin_do, :title, :alt, :media, :description ],
      :reddit => [ :title, :target, :color, :bordercolor, :type, :styled, :newwindow, :btnsrc, :points ],
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
        return super @options.merge :social_buttons => self unless subscriber

        # dirty hack to suppress logging render_partial
        class << subscriber
          alias_method :render_partial_with_logging, :render_partial
          # do nothing
          def render_partial(event); end
        end

        ret = super @options.merge :social_buttons => self

        class << subscriber
          alias_method :render_partial, :render_partial_with_logging
          undef :render_partial_with_logging
        end
        ret
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
