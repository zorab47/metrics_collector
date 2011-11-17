# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metrics_collector/version"

Gem::Specification.new do |s|
  s.name        = "metrics_collector"
  s.version     = MetricsCollector::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Charles Maresh"]
  s.email       = ["zorab47@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Easily define and collect project metrics}
  s.description = %q{Compile and collect application metrics to help guide project decisions.}

  s.rubyforge_project = "metrics_collector"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'watchr'
end
