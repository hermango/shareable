Shareable.configure do |config|
  # configuration "names" determines which social buttons are rendered. The
  # order the buttons are displayed in is decided by the same order as listed
  # here. Valid names are:
  # twitter facebook linkedin pinterest google_plus reddit tumblr stumble_upon
  # config.names = %w[ twitter facebook linkedin pinterest google_plus reddit tumblr stumble_upon ]

  # Renders html links instead of javascript buttons.
  # config.static_link = false

  # Omit initializing javacript code. Only button code is rendered.
  # config.button_only = false

  # Set to true to enable turbolinks fixes. Requires jquery to work!
  # config.turbolinks = false

  ###############
  ## facebook
  ###############

  # required if using facebook button!
  # config.app_id = ''

  # config.send = 'false'

  # 'standard', 'button_count', 'button' or 'box_count'. defaults to 'standard'.
  # config.layout = ''

  # 'true' or 'false'. defaults to 'false'. Don't set to 'true', if kid_directed_site is also 'true'.
  # config.show_faces = ''

  # 'like' or 'recommend'. defaults to 'like'.
  # config.action = ''

  # config.font = ''

  # 'light' or 'dark'. defaults to 'light'.
  # config.colorscheme = ''

  # config.ref = ''

  # 'true' or 'false'. defaults to 'false'.
  # config.share = ''

  # 'true' or 'false'. defaults to 'false'. Facebook assumes your site is not kid friendly.
  # config.kid_directed_site = ''

  ###############
  ## google_plus
  ###############

  # 'none', 'bubble' or 'inline'. defaults to 'bubble'.
  # config.annotation = 'bubble'

  # 'left' or 'right'. defaults to 'left'.
  # config.align = ''

  # comma separated list of 'top', 'right', 'bottom' and 'left'.
  # config.expand_to = ''

  # config.callback = ''

  # config.onstartinteraction = ''

  # config.onendinteraction = ''

  # 'true' or 'false'. defaults to 'true'.
  # config.recommendations = 'false'

  ###############
  ## linkedin
  ###############

  # 'right', 'top' or ''. '' hides counter.
  # config.counter = 'right'

  # name of a javascript function to fire if url is successfully shared.
  # config.onsuccess = ''

  # config.onerror = ''

  # 'true' or 'false'.
  # config.showzero = 'true'

  ###############
  ## pinterest
  ###############

  # 'beside', 'above' or 'none'.
  # config.pin_config = 'beside'

  # 'buttonPin' or 'buttonBookmark'.
  # config.pin_do = 'buttonPin'

  # 'round' or ''.
  # config.pin_shape = ''

  # '28' or ''. '28' is for large button.
  # config.pin_height = ''

  # 'red', 'white' or 'gray'. defaults to 'gray'.
  # config.pin_color = ''

  # alternate text for image tag.
  # config.alt = ''

  # config.media = ''

  ###############
  ## reddit
  ###############

  # subreddit name, eg: 'rails'
  # config.target = ''

  # config.color = ''

  # config.bordercolor = ''

  # 'off' or ''. Only used when btnsrc is not blank.
  # config.styled='off'

  # config.newwindow='1'

  # alternate reddit button url, eg: 'http://www.reddit.com/buttonlite.js?i=1'
  # config.btnsrc = ''

  # config.type= '1' # '1' to '3'.

  # config.points = '1' # '0' to '5'. Only used when btnsrc is not blank.

  ###############
  ## twitter
  ###############

  # screen name of the user to attribute the tweet to.
  # config.via = ''

  # default tweet text. If blank, defaults to value of config.title.
  # config.text = ''

  # related accounts
  # config.related = ''

  # 'none', 'horizontal' or 'vertical'. defaults to 'horizontal'.
  # config.count='horizontal'

  # config.lang='en'

  # url to which your shared url resolves
  # config.counturl = ''

  # comma separated hashtags appended to tweet text
  # config.hashtags = ''

  # 'true' or 'false'. 'true' tailors content and suggestions for twitter users.
  # config.dnt = ''

  ###############
  ## stumble_upon
  ###############

  # '1' to '6'.
  # config.badge_layout = '1'

  ###############
  ## tumblr
  ###############

  # '1' to '4'. Or '1T', '2T', '3T' or '4T'.
  # config.background = '1'

  #################################
  ## General Configuration Options
  #################################

  # used by facebook, google_plus and tumblr.
  # config.width = '80'

  # used by linkedin, pinterest, reddit, stumbleupon and tumblr.
  # config.title = ''

  # used by linkedin and tumblr.
  # config.description = ''

  # Used by twitter and google_plus.
  # google_plus config.size can be 'small', 'medium', 'standard' and 'tall'.
  # Default is 'standard'. Shareable uses 'medium'.
  # twitter config.size can be 'medium' or 'large'. Default is 'medium'.
  # config.size = 'medium'
end
