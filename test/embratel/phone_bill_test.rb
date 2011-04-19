require File.expand_path('../../test_helper', __FILE__)

class Embratel::PhoneBillTest < Test::Unit::TestCase
  FIXTURES_PATH = File.join(File.dirname(__FILE__), '..', 'fixtures')

  VALID_CSV_PHONE_BILL_FILE_PATH = "#{FIXTURES_PATH}/valid_phone_bill_file.csv"

  def test_total_method
    phone_bill = Embratel::PhoneBill.new(VALID_CSV_PHONE_BILL_FILE_PATH)
    assert_equal(10.5, phone_bill.total)
  end
end
