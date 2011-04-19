require File.expand_path('../../test_helper', __FILE__)

class Embratel::PhoneBillTest < Test::Unit::TestCase
  FIXTURES_PATH = File.join(File.dirname(__FILE__), '..', 'fixtures')

  def non_existing_file_path
    "#{FIXTURES_PATH}/non_existing_file.csv"
  end

  def directory_path
    "#{FIXTURES_PATH}"
  end

  def non_phone_bill_file_path
    "#{FIXTURES_PATH}/lorem_ipsum.csv"
  end

  def invalid_csv_phone_bill_file_path
    "#{FIXTURES_PATH}/invalid_phone_bill_file.csv"
  end

  def valid_csv_phone_bill_file_path
    "#{FIXTURES_PATH}/valid_phone_bill_file.csv"
  end

  def non_csv_phone_bill_file_path
    "#{FIXTURES_PATH}/phone_bill.txt"
  end

  def test_phone_bill_instantiation_with_a_non_existing_file_path
    assert_raise(Errno::ENOENT) { Embratel::PhoneBill.new(non_existing_file_path) }
  end

  def test_phone_bill_instantiation_with_a_directory_path
    assert_raise(Errno::EISDIR) { Embratel::PhoneBill.new(directory_path) }
  end

  def test_phone_bill_instantiation_with_a_non_phone_bill_file_path
    assert_raise(Embratel::InvalidPhoneBillFileError) do
      Embratel::PhoneBill.new(non_phone_bill_file_path)
    end
  end

  def test_phone_bill_instantiation_with_an_invalid_csv_phone_bill_file_path
    assert_raise(Embratel::InvalidPhoneBillFileError) do
      Embratel::PhoneBill.new(invalid_csv_phone_bill_file_path)
    end
  end

  def test_does_not_allow_other_file_extensions_than_csv
    assert_raise(Embratel::InvalidPhoneBillFileError) do
      Embratel::PhoneBill.new(non_csv_phone_bill_file_path)
    end
  end

  def test_phone_bill_instantiation_with_a_valid_csv_phone_bill_file_path
    phone_bill = Embratel::PhoneBill.new(valid_csv_phone_bill_file_path)
    assert(!phone_bill.send(:invalid_rows?))
  end

  def test_calls_method
    phone_bill = Embratel::PhoneBill.new(valid_csv_phone_bill_file_path)
    assert_equal(3, phone_bill.calls.size)
  end

  def test_total_method
    phone_bill = Embratel::PhoneBill.new(valid_csv_phone_bill_file_path)
    assert_equal(10.5, phone_bill.total)
  end
end
