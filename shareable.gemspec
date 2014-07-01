$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shareable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shareable"
  s.version     = Shareable::VERSION
  s.authors     = ["Hermango"]
  s.homepage    = "http://github.com/hermango/shareable"
  s.summary     = "Simple and unobtrusive gem for adding social links to your Rails app. Rails 3 and 4 supported."
  s.description = "Add social sharing functionality to your Rails app with one method call. Shareable allows you the choice of displaying javascript buttons or static links. Configuration options for each social site are ready-to-use and entirely customizable. Please see readme for more details."
  s.require_paths = ['lib']
  s.licenses    = ['MIT']
  s.files       = `git ls-files`.split($/)

  #s.test_files = Dir["test/**/*"]

  s.add_dependency 'activesupport', '>= 3.0.0'
  s.add_dependency 'actionpack', '>= 3.0.0'

  s.add_development_dependency 'bundler', '>= 1.0.0'
end
