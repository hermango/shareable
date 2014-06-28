$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shareable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shareable"
  s.version     = Shareable::VERSION
  s.authors     = ["Hermango"]
  s.homepage    = "http://github.com/hermango/shareable"
  s.summary     = "Simple and unobtrusive gem for adding social links to your Rails app."
  s.description = "Add social sharing links to a view in your Rails app with one method call. The configuration options for each social link are customizable. Please see read me doc for more details."
  s.require_paths = ['lib']
  s.licenses    = ['MIT']
  s.files       = `git ls-files`.split($/)

  #s.test_files = Dir["test/**/*"]

  s.add_dependency 'activesupport', '>= 3.0.0'
  s.add_dependency 'actionpack', '>= 3.0.0'

  s.add_development_dependency 'bundler', '>= 1.0.0'
end
