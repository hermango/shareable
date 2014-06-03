Shareable
=========
A simple and unobtrusive gem for adding social buttons or static links to your Rails app. Supported social sites include:
  - Facebook
  - Twitter
  - Pinterest
  - Reddit
  - Linkedin
  - Google Plus
  - Tumblr<sup>*</sup>
  - StumbleUpon<sup>*</sup>

<sub>*Tumblr and StumbleUpon buttons are not rendered by default configuration.</sub>

Install
--------
Put this line in your Gemfile:

  gem 'shareable'

Then run the bundle command:

  bundle

Usage
------
### Views
Use any of the following methods to display shareable in your views:
+ render_shareable
+ facebook_button
+ twitter_button
+ pinterest_button
+ linkedin_button
+ reddit_button
+ google_plus_button
+ tumblr_button
+ stumble_upon_button

For the easiest and most standard way of adding shareable, use this helper method in your view:

```no-highlight
<%= render_shareable %>
```

#### Static Links

Shareable generates javascript buttons by default. To render plain html links instead, set the configuration option 'static_link' to *true* in your local shareable.rb configuration file or pass 'static_link' when calling a shareable method like so:

```no-highlight
<%= render_shareable :static_link => true %>
```

#### Tumblr and StumbleUpon Buttons

By default Tumblr and StumbleUpon are disabled. To enable either button, include the name of the button you want to add (*tumblr* or *stumble_upon*) in the configuration option 'names' found in your shareable.rb configuration file. [See Configuration](https://github.com/hermango/shareable#configuration) for more information. 


### Advanced Usage
Pass hash values to the render_shareable method to overwrite options locally:
```no-highlight
<%= render_shareable :url=> 'http://github.com/hermango/', :facebook=> {:send=> 'true', :url=> 'http://demo.com'} %>
```

To render only certain buttons:
```no-highlight
<%= render_shareable :buttons=> ['twitter', 'facebook', 'tumblr'] %>
```

Alternatively, omit the render_shareable method entirely and instead add each social link individually.
The helper method for each social link, is the site name joined with an underscore to the word 'button'. E.g.:

```no-highlight
<%= twitter_button %>
<%= reddit_button :title=> 'Alternate Title' %>
```

To override the default view for a button, place your own template file in the
app/views/shareable/ directory of your app and prepend your filename with an underscore.

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

A generator is available for generating the default configuration file into your project's 'config/initializers' directory.
Run the following generator command, then edit the generated file.

rails g shareable:config

This project was inspired by Akira Matsuda's Kaminari project and uses the MIT-LICENSE. Suggestions, bug reports, criticism and all contributions welcome.
