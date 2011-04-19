module Embratel
  class PhoneBill
    attr_reader :calls

    def initialize(path)
      @calls = CSVParser.parse(path)
    end

    def total
      @total ||= calls.inject(0) { |sum, call| sum += call.cost.to_f }
    end
  end
end
