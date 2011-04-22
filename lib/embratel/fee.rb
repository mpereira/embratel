module Embratel
  class Fee < Payable
    def valid?
      super && number_called.empty?
    end
  end
end
