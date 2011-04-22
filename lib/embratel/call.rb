module Embratel
  class Call < Payable
    NUMBER_CALLED_REGEXP = /^\d{10}$/

    def valid?
      super && !!(number_called =~ NUMBER_CALLED_REGEXP)
    end
  end
end
