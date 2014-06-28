require 'active_support/configurable'

module Shareable
  # Configures global settings for Shareable
  def self.configure(&block)
    yield @config ||= Shareable::Configuration.new
  end

  # Global settings for Shareable
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :names, :url, :send, :layout, :show_faces, :title, :alt, :target, :app_id,
                    :width, :action, :font, :colorscheme, :ref, :annotation, :align, :expand_to, :callback,
                    :onstartinteraction, :onendinteraction, :pin_config, :pin_do, :media, :color,
                    :bordercolor, :btnsrc, :via, :text, :related, :count, :lang, :counturl, :hashtags, :size, :dnt,
                    :type, :styled, :newwindow, :description, :counter, :onsuccess, :onerror, :showzero,
                    :recommendations, :points, :badge_layout, :background, :share, :kid_directed_site,
                    :button_only, :static_link, :turbolinks
  end

  configure do |config|
    config.names = %w[ twitter facebook linkedin pinterest google_plus reddit ]

    config.button_only=false # omit initializing javacript code. Only button code is rendered.
    config.static_link=false # renders html links instead of javascript buttons.
    
    config.turbolinks=true # set to true to enable turbolinks fixes. Requires jquery to work!

    ##############
    #facebook
    ##############
    config.app_id = ''
    config.send= 'false'
    config.layout='button_count'
    config.show_faces=''
    config.action=''
    config.font=''
    config.colorscheme=''
    config.ref=''
    config.share=''
    config.kid_directed_site=''

    ##############
    #google_plus
    ##############
    config.annotation='bubble'
    config.recommendations='false'
    config.align=''
    config.expand_to=''
    config.callback=''
    config.onstartinteraction=''
    config.onendinteraction=''

    ##############
    #linkedin
    ##############
    config.counter = 'right'
    config.onsuccess = '' 
    config.onerror = ''
    config.showzero = 'true'

    ##############
    #pinterest
    ##############
    config.pin_config = 'beside'
    config.pin_do = 'buttonPin'
    config.alt='' # alternate text for image tag
    config.media=''

    ##############
    #reddit 
    ##############
    config.target=''
    config.color=''
    config.bordercolor=''
    config.styled='off'
    config.newwindow='1'
    config.btnsrc='' # alternate reddit button url, eg: 'http://www.reddit.com/buttonlite.js?i=1'
    config.type= '1' # button type, eg: 1 to n
    config.points = '1' # points style, eg: 0 to 5

    ##############
    #twitter
    ##############
    config.via='tweetbutton'
    config.text=''
    config.related=''
    config.count='horizontal'
    config.lang='en'
    config.counturl=''
    config.hashtags=''
    config.size='medium'
    config.dnt=''

    ##############
    #stumble_upon
    ##############
    config.badge_layout='1'

    ##############
    #tumblr
    ##############
    config.background='share_1.png'

    ##############
    #shared configuration options
    ##############
    config.width='80' # used by facebook and tumblr
    config.title= '' # used by linkedin, pinterest, reddit, stumbleupon and tumblr
    config.description='' # used by linkedin and tumblr
  end
end
