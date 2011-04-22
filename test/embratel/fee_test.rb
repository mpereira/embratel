require File.expand_path('../../test_helper', __FILE__)

class FeeTest < Test::Unit::TestCase
  include ValidRows

  ROW_WITH_NUMBER_CALLED = ['1',
                            '1634125644-FRANQUIA 01',
                            '04 - LIGACOES DDD PARA CELULARES',
                            '11/08/10 A  99/99/99',
                            '19936928871',
                            'SCL -SP',
                            'CAS -SP',
                            '02:56:29 AM',
                            '',
                            'E',
                            '',
                            '500',
                            'MIN',
                             '0.73']

  def test_valid_with_a_row_with_number_called
    fee = Embratel::Fee.new(ROW_WITH_NUMBER_CALLED)
    assert(!fee.valid?)
  end

  def test_valid_with_a_valid_call_row
    assert(!Embratel::Fee.new(VALID_CALL_ROW).valid?)
  end

  def test_valid_with_a_valid_fee_row
    fee = Embratel::Fee.new(VALID_FEE_ROW)
    assert(fee.valid?)
    assert_equal('1', fee.id)
    assert_equal('1634125644-FRANQUIA 01', fee.caller)
    assert_equal('04 - LIGACOES DDD PARA CELULARES', fee.description)
    assert_equal('11/08/10 A  99/99/99', fee.date)
    assert_equal('', fee.number_called)
    assert_equal('SCL -SP', fee.caller_local)
    assert_equal('CAS -SP', fee.called_local)
    assert_equal('02:56:29 AM', fee.start_time)
    assert_equal('', fee.end_time)
    assert_equal('E', fee.imp)
    assert_equal('', fee.country)
    assert_equal('500', fee.quantity)
    assert_equal('MIN', fee.unit)
    assert_equal('0.73', fee.cost)
  end
end
