require File.expand_path('../../test_helper', __FILE__)

class PayableTest < Test::Unit::TestCase
  include ValidRows

  ROW_WITH_A_MISSING_FIELD = ['1',
                              '1634125644-FRANQUIA 01',
                              '04 - LIGACOES DDD PARA CELULARES',
                              '11/08/10 A  99/99/99',
                              'SCL -SP',
                              'CAS -SP',
                              '02:56:29 AM',
                              '',
                              'E',
                              '',
                              '500',
                              'MIN',
                              '0.73']

  ROW_WITH_INVALID_COST = ['1',
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
                            '.73']

  ROW_WITH_COST_WITH_SPACES_IN_THE_BEGINNING = ['1',
                                           '1634125644-FRANQUIA 01',
                                           '04 - LIGACOES DDD PARA CELULARES',
                                           '11/08/10 A  99/99/99',
                                           '1993692887',
                                           'SCL -SP',
                                           'CAS -SP',
                                           '02:56:29 AM',
                                           '',
                                           'E',
                                           '',
                                           '500',
                                           'MIN',
                                           ' 0.73']

  def test_call_with_call
    assert(Embratel::Call.new(VALID_CALL_ROW).call?)
  end

  def test_call_with_fee
    assert(!Embratel::Fee.new(VALID_FEE_ROW).call?)
  end

  def test_fee_with_fee
    assert(Embratel::Fee.new(VALID_FEE_ROW).fee?)
  end

  def test_fee_with_call
    assert(!Embratel::Call.new(VALID_CALL_ROW).fee?)
  end

  def test_valid_with_a_row_with_a_missing_field
    assert(!Embratel::Payable.new(ROW_WITH_A_MISSING_FIELD).valid?)
  end

  def test_valid_with_a_row_with_invalid_cost
    assert(!Embratel::Payable.new(ROW_WITH_INVALID_COST).valid?)
  end

  def test_valid_with_row_with_cost_with_spaces_in_the_beginning
    payable = Embratel::Payable.new(ROW_WITH_COST_WITH_SPACES_IN_THE_BEGINNING)
    assert(payable.valid?)
    assert_equal('0.73', payable.cost)
  end

  def test_valid_with_a_valid_call_row
    assert(Embratel::Payable.new(VALID_CALL_ROW).valid?)
  end

  def test_valid_with_a_valid_fee_row
    assert(Embratel::Payable.new(VALID_FEE_ROW).valid?)
  end
end
