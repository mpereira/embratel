require File.expand_path('../../test_helper', __FILE__)

class Embratel::CSVParserTest < Test::Unit::TestCase
  FIXTURES_PATH = File.join(File.dirname(__FILE__), '..', 'fixtures')

  NON_EXISTING_FILE_PATH           = "#{FIXTURES_PATH}/non_existing_file.csv"
  DIRECTORY_PATH                   = "#{FIXTURES_PATH}"
  NON_PHONE_BILL_FILE_PATH         = "#{FIXTURES_PATH}/lorem_ipsum.csv"
  INVALID_CSV_PHONE_BILL_FILE_PATH = "#{FIXTURES_PATH}/invalid_phone_bill_file.csv"
  VALID_CSV_PHONE_BILL_FILE_PATH   = "#{FIXTURES_PATH}/valid_phone_bill_file.csv"
  NON_CSV_PHONE_BILL_FILE_PATH     = "#{FIXTURES_PATH}/phone_bill.txt"

  def test_csv_parser_instantiation_with_a_non_existing_file_path
    assert_raise(Errno::ENOENT) do
      Embratel::CSVParser.parse(NON_EXISTING_FILE_PATH)
    end
  end

  def test_csv_parser_instantiation_with_a_directory_path
    assert_raise(Errno::EISDIR) { Embratel::CSVParser.parse(DIRECTORY_PATH) }
  end

  def test_csv_parser_instantiation_with_a_non_phone_bill_file_path
    assert_raise(Embratel::InvalidRowsError) do
      Embratel::CSVParser.parse(NON_PHONE_BILL_FILE_PATH)
    end
  end

  def test_csv_parser_instantiation_with_an_invalid_csv_phone_bill_file
    assert_raise(Embratel::InvalidRowsError) do
      Embratel::CSVParser.parse(INVALID_CSV_PHONE_BILL_FILE_PATH)
    end
  end

  def test_does_not_allow_other_file_extensions_than_csv
    assert_raise(Embratel::NonCSVFileError) do
      Embratel::CSVParser.parse(NON_CSV_PHONE_BILL_FILE_PATH)
    end
  end

  def test_parse_with_valid_phone_bill_file
    payables = Embratel::CSVParser.parse(VALID_CSV_PHONE_BILL_FILE_PATH)
    calls = payables.select(&:call?)
    fees = payables.select(&:fee?)
    assert_equal(5, payables.size)
    assert_equal(4, calls.size)
    assert_equal(1, fees.size)
  end
end
