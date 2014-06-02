module Shareable
  module Helpers

    class Tag
      def initialize(template, options = {}) #:nodoc:
        @template, @options = template, options.dup
      end

      def to_s(locals = {}) #:nodoc:
        @template.render :partial => "shareable/#{self.class.name.demodulize.underscore}", :locals => @options.merge(locals)
      end
    end

    class Socialize < Tag
      def to_s(locals={}, caption="") #:nodoc:
        locals[:options] ||= {}
        social_site=(locals[:options][:button_name]=self.class.name.demodulize.underscore.downcase).to_sym
        locals[:options][:button_caption] = caption
        if @options[:options]
          @options[:filtered] ||= @options[:options].reject {|opt| locals[:options].include?(opt)}
          locals[:options].merge!(@options[:filtered])
        end
        if @options[social_site]
          locals[:options].merge!(@options[social_site])
        end
        super locals
      end
    end

    class Facebook < Socialize
      def to_s(locals={}) #:nodoc:
        if (@options[:options][:static_link] && !(@options[:facebook] && @options[:facebook][:static_link]==false)) || (@options[:facebook] && @options[:facebook][:static_link])
          locals[:options] ||= {}
          p_opts = {:url => CGI::escape(@options[:options][:url])}
          locals[:options].merge!(@options[:options].merge(p_opts))
          if @options[:facebook]
            @options[:facebook][:url] = CGI::escape(@options[:facebook][:url]) if @options[:facebook][:url]
          end
        end
        super locals, "Facebook"
      end
    end

    class GooglePlus < Socialize
      def to_s(locals={}) #:nodoc:
        if (@options[:options][:static_link] && !(@options[:google_plus] && @options[:google_plus][:static_link]==false)) || (@options[:google_plus] && @options[:google_plus][:static_link])
          locals[:options] ||= {}
          p_opts = {:url => CGI::escape(@options[:options][:url])}
          locals[:options].merge!(@options[:options].merge(p_opts))
          if @options[:google_plus]
            @options[:google_plus][:url] = CGI::escape(@options[:google_plus][:url]) if @options[:google_plus][:url]
          end
        end
        super locals, "Google+"
      end
    end

    class Linkedin < Socialize
      def to_s(locals={}) #:nodoc:
        if (@options[:options][:static_link] && !(@options[:linkedin] && @options[:linkedin][:static_link]==false)) || (@options[:linkedin] && @options[:linkedin][:static_link])
          locals[:options] ||= {}
          p_opts = {:description => CGI::escape(@options[:options][:description]),
                    :title => CGI::escape(@options[:options][:title]),
                    :url => CGI::escape(@options[:options][:url])}
          locals[:options].merge!(@options[:options].merge(p_opts))
          if @options[:linkedin]
            @options[:linkedin][:description] = CGI::escape(@options[:linkedin][:description]) if @options[:linkedin][:description]
            @options[:linkedin][:title] = CGI::escape(@options[:linkedin][:title]) if @options[:linkedin][:title]
            @options[:linkedin][:url] = CGI::escape(@options[:linkedin][:url]) if @options[:linkedin][:url]
          end
        end
        super locals, "LinkedIn"
      end
    end

    class Pinterest < Socialize
      def to_s(locals={}) #:nodoc:
        locals[:options] ||= {}
        p_opts = {:description => CGI::escape(@options[:options][:description]),
                  :url => CGI::escape(@options[:options][:url]),
                  :media => CGI::escape(@options[:options][:media])}
        locals[:options].merge!(@options[:options].merge(p_opts))
        if @options[:pinterest]
          @options[:pinterest][:description] = CGI::escape(@options[:pinterest][:description]) if @options[:pinterest][:description]
          @options[:pinterest][:url] = CGI::escape(@options[:pinterest][:url]) if @options[:pinterest][:url]
          @options[:pinterest][:media] = CGI::escape(@options[:pinterest][:media]) if @options[:pinterest][:media]
        end
        super locals, "Pinterest"
      end
    end

    class Reddit < Socialize
      def to_s(locals={}) #:nodoc:
        if (@options[:options][:static_link] && !(@options[:reddit] && @options[:reddit][:static_link]==false)) || (@options[:reddit] && @options[:reddit][:static_link])
          locals[:options] ||= {}
          p_opts = {:title => CGI::escape(@options[:options][:title]),
                    :url => CGI::escape(@options[:options][:url])}
          locals[:options].merge!(@options[:options].merge(p_opts))
          if @options[:reddit]
            @options[:reddit][:title] = CGI::escape(@options[:reddit][:title]) if @options[:reddit][:title]
            @options[:reddit][:url] = CGI::escape(@options[:reddit][:url]) if @options[:reddit][:url]
          end
        end
        super locals, "Reddit"
      end
    end

    class StumbleUpon < Socialize
      def to_s(locals={}) #:nodoc:
        if (@options[:options][:static_link] && !(@options[:stumble_upon] && @options[:stumble_upon][:static_link]==false)) || (@options[:stumble_upon] && @options[:stumble_upon][:static_link])
          locals[:options] ||= {}
          p_opts = {:title => CGI::escape(@options[:options][:title]),
                    :url => CGI::escape(@options[:options][:url])}
          locals[:options].merge!(@options[:options].merge(p_opts))
          if @options[:stumble_upon]
            @options[:stumble_upon][:title] = CGI::escape(@options[:stumble_upon][:title]) if @options[:stumble_upon][:title]
            @options[:stumble_upon][:url] = CGI::escape(@options[:stumble_upon][:url]) if @options[:stumble_upon][:url]
          end
        end
        super locals, "StumbleUpon"
      end
    end

    class Tumblr < Socialize
      def to_s(locals={}) #:nodoc:
        locals[:options] ||= {}
        p_opts = {:description => CGI::escape(@options[:options][:description]),
                  :url => CGI::escape(@options[:options][:url]),
                  :title => CGI::escape(@options[:options][:title])}
        locals[:options].merge!(@options[:options].merge(p_opts))
        if @options[:tumblr]
          @options[:tumblr][:description] = CGI::escape(@options[:tumblr][:description]) if @options[:tumblr][:description]
          @options[:tumblr][:url] = CGI::escape(@options[:tumblr][:url]) if @options[:tumblr][:url]
          @options[:tumblr][:title] = CGI::escape(@options[:tumblr][:title]) if @options[:tumblr][:title]
        end
        super locals, "Tumblr"
      end
    end

    class Twitter <  Socialize
      def to_s(locals={}) #:nodoc:
        locals[:options] ||= {}
        if locals[:options][:text].blank? && @options[:options][:text].blank? && (@options[:twitter] ? @options[:twitter][:text].blank? : true) && @options[:options][:title]
          locals[:options][:text] = @options[:options][:title]
        end
        if (@options[:options][:static_link] && !(@options[:twitter] && @options[:twitter][:static_link]==false)) || (@options[:twitter] && @options[:twitter][:static_link])
          p_opts = {:text => CGI::escape(locals[:options][:text] ? locals[:options][:text] : (@options[:options][:text] ? @options[:options][:text] : '')),
                    :url => CGI::escape(@options[:options][:url]),
                    :hashtags => @options[:options][:hashtags].blank? ? '' : @options[:options][:hashtags].split(',').map{|tag| CGI::escape(tag)}.join(',')}
          locals[:options].merge!(@options[:options].merge(p_opts))
          if @options[:twitter]
            @options[:twitter][:text] = CGI::escape(@options[:twitter][:text]) if @options[:twitter][:text]
            @options[:twitter][:url] = CGI::escape(@options[:twitter][:url]) if @options[:twitter][:url]
            @options[:twitter][:hashtags] = @options[:twitter][:hashtags].split(',').map{|tag| CGI::escape(tag)}.join(',') if @options[:twitter][:hashtags]
          end
        end
        super locals, "Twitter"
      end
    end

  end
end
