require 'rubygems'

begin
  require 'bundler'
rescue LoadError
  STDERR.puts "You need to install bundler"
else
  begin
    Bundler.setup
  rescue Bundler::BundlerError
    STDERR.puts $!
  end
end

require 'embratel/phone_bill'
require 'embratel/call'

module Embratel
  class InvalidPhoneBillFileError < StandardError; end
end
