require File.expand_path('../../test_helper', __FILE__)

class Embratel::PhoneBillTest < Test::Unit::TestCase
  FIXTURES_PATH = File.join(File.dirname(__FILE__), '..', 'fixtures')

  VALID_CSV_PHONE_BILL_FILE_PATH = "#{FIXTURES_PATH}/valid_phone_bill_file.csv"

  def test_calls
    phone_bill = Embratel::PhoneBill.new(VALID_CSV_PHONE_BILL_FILE_PATH)
    assert_equal(4, phone_bill.calls.size)
    phone_bill.calls.each { |call| assert(call.is_a?(Embratel::Call)) }
  end

  def test_fees
    phone_bill = Embratel::PhoneBill.new(VALID_CSV_PHONE_BILL_FILE_PATH)
    assert_equal(1, phone_bill.fees.size)
    phone_bill.fees.each { |fee| assert(fee.is_a?(Embratel::Fee)) }
  end

  def test_total
    phone_bill = Embratel::PhoneBill.new(VALID_CSV_PHONE_BILL_FILE_PATH)
    assert_equal(11.7, phone_bill.total)
  end
end
