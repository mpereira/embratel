if RUBY_VERSION < '1.9'
  require 'fastercsv'
  CSV = FasterCSV
else
  require 'csv'
end

require File.expand_path('../embratel/payable', __FILE__)
require File.expand_path('../embratel/call', __FILE__)
require File.expand_path('../embratel/fee', __FILE__)
require File.expand_path('../embratel/csv_parser', __FILE__)
require File.expand_path('../embratel/phone_bill', __FILE__)

module Embratel
  VERSION = '1.1.1'

  class InvalidPhoneBillFileError < StandardError; end
  class InvalidRowsError < StandardError; end
  class NonCSVFileError < StandardError; end
  class InvalidCSVFileError < StandardError; end
end
