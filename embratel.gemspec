# -*- encoding: utf-8 -*-

require File.expand_path('../lib/embratel', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'embratel'
  s.version     = Embratel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Murilo Pereira'
  s.email       = 'murilo@murilopereira.com'
  s.homepage    = 'https://github.com/murilasso/embratel'
  s.summary     = "Easily extract data from Embratel's phone bill files."

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'embratel'

  s.add_development_dependency 'bundler', '>= 1.0.0'
  s.add_development_dependency 'rake', '0.8.7'

  s.add_dependency('fastercsv', '1.5.3') if RUBY_VERSION < '1.9'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
