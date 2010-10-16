# -*- encoding: utf-8 -*-
require File.expand_path("../lib/embratel/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "embratel"
  s.version     = Embratel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Murilo Soares Pereira"]
  s.email       = ["murilo.soares3@gmail.com"]
  s.homepage    = "http://github.com/murilasso/embratel"
  s.summary     = "Gem for extracting information from Embratel's phone bill files."
  s.description = ""

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "embratel"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rake", "0.8.7"

  s.add_dependency "fastercsv", "1.5.3"

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
