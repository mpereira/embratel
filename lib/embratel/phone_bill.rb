module Embratel
  class PhoneBill
    attr_reader :payables

    def initialize(path)
      @payables = CSVParser.parse(path)
    end

    def calls
      @calls ||= payables.select(&:call?)
    end

    def fees
      @fees ||= payables.select(&:fee?)
    end

    def total
      @total ||= payables.inject(0) { |sum, payable| sum += payable.cost.to_f }
    end
  end
end
