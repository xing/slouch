# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "slouch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "slouch"
  s.version     = Slouch::VERSION
  s.authors     = ["Timothy Payton", "Ömür Özkir"]
  s.email       = ["timothy.payton@xing.com", "oemuer.oezkir@xing.com"]
  s.summary     = "Backbone Scaffolding for Rails projects"
  s.description = "Backbone Scaffolding for Rails projects"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "turn"
  s.add_development_dependency "minitest"
  # s.require_paths = ['lib']
end
