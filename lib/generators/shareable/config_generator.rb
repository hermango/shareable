module Shareable
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies Shareable configuration file to your application's initializer directory.
DESC

      def copy_config_file
        template 'shareable_config.rb', 'config/initializers/shareable.rb'
      end
    end
  end
end
