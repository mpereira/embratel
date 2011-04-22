module Embratel
  class Call < Payable
    MANGLED_PHONE_NUMBER_REGEXP = '\d{5}-{5}'
    REGULAR_PHONE_NUMBER_REGEXP = '\d{10}'
    NUMBER_CALLED_REGEXP = /^(?:#{MANGLED_PHONE_NUMBER_REGEXP}|#{REGULAR_PHONE_NUMBER_REGEXP})$/

    def valid?
      super && !!(number_called =~ NUMBER_CALLED_REGEXP)
    end
  end
end
