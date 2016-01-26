$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ar_toolkit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ar_toolkit"
  s.version     = ArToolkit::VERSION
  s.authors     = ["Haziman Hashim"]
  s.email       = ["haziman@abh.my"]
  s.homepage    = "ww.abh.my"
  s.summary     = "AR Toolkit"
  s.description = "Rails ActiveRecord Toolkit."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
