module Shareable
end

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

$stderr.puts <<-EOC if !defined?(Rails)
warning: no rails framework detected.

Your Gemfile might not be configured properly.
---- e.g. ----
Rails:
    gem 'shareable'
EOC

require 'shareable/config'
require 'shareable/helpers/action_view_extension'
require 'shareable/helpers/social_buttons'
require 'shareable/hooks'
if defined? Rails
  require 'shareable/railtie'
  require 'shareable/engine'
end