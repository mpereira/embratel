require File.expand_path('../../test_helper', __FILE__)

class CallTest < Test::Unit::TestCase
  include ValidRows

  ROW_WITH_INVALID_NUMBER_CALLED = ['1',
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

  ROW_WITH_MANGLED_NUMBER_CALLED = ['1',
                                    '1634125644-FRANQUIA 01',
                                    '04 - LIGACOES DDD PARA CELULARES',
                                    '11/08/10 A  99/99/99',
                                    '19936-----',
                                    'SCL -SP',
                                    'CAS -SP',
                                    '02:56:29 AM',
                                    '',
                                    'E',
                                    '',
                                    '500',
                                    'MIN',
                                     '0.73']

  def test_valid_with_a_row_with_invalid_number_called
    assert(!Embratel::Call.new(ROW_WITH_INVALID_NUMBER_CALLED).valid?)
  end

  def test_valid_with_a_row_with_mangled_number_called
    assert(Embratel::Call.new(ROW_WITH_MANGLED_NUMBER_CALLED).valid?)
  end

  def test_valid_with_a_valid_fee_row
    assert(!Embratel::Call.new(VALID_FEE_ROW).valid?)
  end

  def test_valid_with_a_valid_call_row
    call = Embratel::Call.new(VALID_CALL_ROW)
    assert(call.valid?)
    assert_equal('1', call.id)
    assert_equal('1634125644-FRANQUIA 01', call.caller)
    assert_equal('04 - LIGACOES DDD PARA CELULARES', call.description)
    assert_equal('11/08/10 A  99/99/99', call.date)
    assert_equal('1993692887', call.number_called)
    assert_equal('SCL -SP', call.caller_local)
    assert_equal('CAS -SP', call.called_local)
    assert_equal('02:56:29 AM', call.start_time)
    assert_equal('', call.end_time)
    assert_equal('E', call.imp)
    assert_equal('', call.country)
    assert_equal('500', call.quantity)
    assert_equal('MIN', call.unit)
    assert_equal('0.73', call.cost)
  end
end
