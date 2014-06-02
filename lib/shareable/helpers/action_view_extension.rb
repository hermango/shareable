require 'shareable/helpers/social_buttons'

module Shareable
  # = Helpers
  module ActionViewExtension
    def html_attributes(attributes, opts={})
      opts = {
        :data => false
      }.merge(opts)

      prefix = opts[:data] ? 'data-' : ''
      attributes.map { |(k, v)|
        if v.present?
          %{#{prefix}#{k.to_s.camelize(:lower)}="#{html_escape( v )}"}.html_safe
        end
      }.compact.join( " " ).html_safe
    end

    # A helper that renders social links
    #   <%= render_shareable [options] %>
    def render_shareable(options = {}, &block)
      buttons = Shareable::Helpers::SocialButtons.new self, refine_options(options)
      buttons.to_s
    end

    Shareable::Helpers::SocialButtons.buttons.each do |button|
      eval <<-DEF
    def #{button}_button(options = {})
      #{button} = Shareable::Helpers::#{button.split('_').collect(&:capitalize).join}.new self, refine_options(options, :#{button})
      #{button}.to_s
    end
      DEF
    end

    #credit to http://elektronaut.no/
    def output_once(name, &block) #:nodoc:
      @output_once_blocks ||= []
      unless @output_once_blocks.include?(name)
        @output_once_blocks << name
        capture(&block)
      end
    end

    protected
    def refine_options(options={},button=nil)
      options[:options] ||= {}
      options[:options].merge! options.except(:options)
      if options.has_key?(:buttons) then
        options[:buttons].map!(&:to_s)
      end
      if options[:url].blank? then
        options[:options][:url] = request.url
      end
      #only do for button method calls, don't do this render_shareable
      if button
        #add values from configuration to our options for each option that is not passed as part of the button method call
        (Shareable::Helpers::SocialButtons.config_options[button] - options[:options].keys).each do |key|
            options[:options][key] = Shareable.config.config.values_at(key).first
        end
      end
      options
    end
  end
end
