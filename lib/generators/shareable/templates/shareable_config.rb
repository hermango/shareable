Shareable.configure do |config|

  ## configuration "names" determines which social buttons are rendered. The order the buttons are
  ## displayed in is decided by the same order as listed here.
  ## Valid names are: twitter facebook linkedin pinterest google_plus reddit tumblr stumble_upon
  #config.names = %w[ twitter facebook linkedin pinterest google_plus reddit tumblr stumble_upon ]

  #config.static_link=false # renders html links instead of javascript buttons.
  #config.button_only=false # omit initializing javacript code. Only button code is rendered.
  #config.turbolinks=false # set to true to enable turbolinks fixes. Requires jquery to work!

  ###############
  ##facebook
  ###############
  #config.app_id='' # required if using facebook button!
  #config.send= 'false'
  #config.layout='' # 'standard', 'button_count', 'button' or 'box_count'. '' defaults to 'standard'.
  #config.show_faces='' # 'true' or 'false'. '' defaults to 'false'. Don't set to 'true', if kid_directed_site is also 'true'.
  #config.action='' # 'like' or 'recommend'. '' defaults to 'like'.
  #config.font=''
  #config.colorscheme='' # 'light' or 'dark'. '' defaults to 'light'.
  #config.ref=''
  #config.share='' # 'true' or 'false'. '' defaults to 'false'.
  #config.kid_directed_site='' # 'true' or 'false'. '' defaults to 'false'. Facebook assumes your site is not kid friendly.

  ###############
  ##google_plus
  ###############
  #config.annotation='bubble' # 'none', 'bubble' or 'inline'. '' defaults to 'bubble'.
  #config.align='' # 'left' or 'right'. '' defaults to 'left'.
  #config.expand_to='' # comma separated list of 'top', 'right', 'bottom' and 'left'.
  #config.callback='' 
  #config.onstartinteraction=''
  #config.onendinteraction=''
  #config.recommendations='false' # 'true' or 'false'. '' defaults to 'true'.

  ###############
  ##linkedin
  ###############
  #config.counter = 'right' # 'right', 'top' or ''. '' hides counter.
  #config.onsuccess = '' # name of a javascript function to fire if url is successfully shared.
  #config.onerror = ''
  #config.showzero = 'true' # 'true' or 'false'.

  ###############
  ##pinterest
  ###############
  #config.pin_config = 'beside' # 'beside', 'above' or 'none'.
  #config.pin_do = 'buttonPin' # 'buttonPin' or 'buttonBookmark'.
  #config.pin_shape='' # 'round' or ''.
  #config.pin_height='' # '28' or ''. '28' is for large button.
  #config.pin_color='' # 'red', 'white' or 'gray'. '' defaults to 'gray'.
  #config.alt='' # alternate text for image tag.
  #config.media=''

  ###############
  ##reddit
  ###############
  #config.target='' # subreddit name, eg: 'rails'
  #config.color=''
  #config.bordercolor=''
  #config.styled='off' # 'off' or ''. Only used when btnsrc is not blank.
  #config.newwindow='1'
  #config.btnsrc='' # alternate reddit button url, eg: 'http://www.reddit.com/buttonlite.js?i=1'
  #config.type= '1' # '1' to '3'.
  #config.points = '1' # '0' to '5'. Only used when btnsrc is not blank.

  ###############
  ##twitter
  ###############
  #config.via='' # screen name of the user to attribute the tweet to.
  #config.text='' # default tweet text. If blank, defaults to value of config.title.
  #config.related='' # related accounts
  #config.count='horizontal' # 'none', 'horizontal' or 'vertical'. '' defaults to 'horizontal'.
  #config.lang='en'
  #config.counturl='' # url to which your shared url resolves
  #config.hashtags='' # comma separated hashtags appended to tweet text
  #config.dnt='' # 'true' or 'false'. 'true' tailors content and suggestions for twitter users.

  ###############
  ##stumble_upon
  ###############
  #config.badge_layout='1' # '1' to '6'.

  ###############
  ##tumblr
  ###############
  #config.background='1' # '1' to '4'. Or '1T', '2T', '3T' or '4T'.

  ###############
  ##shared configuration options
  ###############
  #config.width='80' # used by facebook, google_plus and tumblr.
  #config.title= '' # used by linkedin, pinterest, reddit, stumbleupon and tumblr.
  #config.description='' # used by linkedin and tumblr.
  #config.size='medium' # used by twitter and google_plus.
  ## google_plus config.size can be 'small', 'medium', 'standard' and 'tall'. Default is 'standard'. Shareable uses 'medium'.
  ## twitter config.size can be 'medium' or 'large'. Default is medium'.
end