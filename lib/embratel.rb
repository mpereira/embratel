if RUBY_VERSION < '1.9'
  require 'fastercsv'
  CSV = FasterCSV
else
  require 'csv'
end

require 'embratel/call.rb'
require 'embratel/phone_bill.rb'

module Embratel
  VERSION = '1.0.0'

  class InvalidPhoneBillFileError < StandardError; end
end
