Shareable
=========
A simple and unobtrusive gem for adding social link sharing to your Rails app. Supported social sites include:
  - Facebook
  - Twitter
  - Pinterest
  - Reddit
  - Linkedin
  - Google Plus

Install
--------
Put this line in your Gemfile:

  gem 'shareable'

Then run the bundle command:

  bundle

Usage
------
### Views
To add shareable in views use any of the following methods:
+ render_shareable
+ facebook_button
+ twitter_button
+ pinterest_button
+ linkedin_button
+ reddit_button
+ google_plus_button

For the easiest way to use shareable, add this helper method to your view:

```no-highlight
<%= render_shareable %>
```

### Advanced Usage
Pass hash values to the render_shareable method to overwrite options locally:
```no-highlight
<%= render_shareable :url=> 'http://github.com/hermango/', :facebook=> {:send=> 'true', :url=> 'http://demo.com'} %>
```

To render only certain buttons:
```no-highlight
<%= render_shareable :buttons=> ['twitter', 'facebook'] %>
```

Alternatively, omit the render_shareable method entirely and instead add each social link individually.
The helper method for each social link, is the site name joined with an underscore to the word 'button'. E.g.:

```no-highlight
<%= twitter_button %>
<%= reddit_button :title=> 'Alternate Title' %>
```

To override the default view for a button, place your own template file in the
app/views/shareable/ directory and prepend your filename with an underscore.

E.g.: facebook_button -> app/views/shareable/_facebook.html.erb

#### Facebook compatibility with Internet Explorer
Add an XML namespace fb='http://ogp.me/ns/fb#' to the <html> tag of your view. Eg: 
```no-highlight
<html xmlns:fb="http://ogp.me/ns/fb#">
```

This is necessary for XFBML to work in earlier versions of Internet Explorer.

#### Styling for social buttons
For horizontally aligned buttons, try this CSS:

```no-highlight
nav.share {display:inline-block;} /* shareable's nav tag */
nav.share div {float:left; overflow:hidden;}
nav.share iframe {max-height:20px; border:0; margin-top:0; padding-top:0;} /* if using medium sized buttons */
#___plusone_0 {max-width:70px; font-size: default; !important}
.twitter-share-button, .twitter-count-horizontal {max-width:80px;}
.fb_iframe_widget span { vertical-align: top; }
.fb_edge_widget_with_comment { vertical-align: top;}
.fb-like{display:inline-block}
* html .fb-like{display:inline}/* ie6 inline block fix*/
*+html .fb-like{display:inline}/* ie7 inline block fix*/
```

Configuration
------------
Use shareable's default configuration settings or add your own initializer named 'shareable.rb' to your app's 'config/initializers' directory.

A generator is available for generating the default configuration file into the 'config/initializers' directory.
Run the following generator command, then edit the generated file.

rails g shareable:config

To Do:
---------
- Add Tests.
- More buttons.

This project is based on Akira Matsuda's Kaminari project and uses the MIT-LICENSE. Suggestions, bug reports, criticism and all contributions welcome.
