module Embratel
  class Payable
    COST_REGEXP = /^\d+(?:\.\d+)?$/
    FIELDS = %w[id
                caller
                description
                date
                number_called
                caller_local
                called_local
                start_time
                end_time
                imp
                country
                quantity
                unit
                cost]

    FIELDS.each { |field| attr_accessor field.to_sym }

    def initialize(row)
      @row = row

      FIELDS.each_with_index do |field, index|
        instance_variable_set("@#{field}".to_sym, row[index].to_s.strip)
      end
    end

    def call?
      is_a?(Call)
    end

    def fee?
      is_a?(Fee)
    end

    def valid?
      @row.size == 14 && !!(cost =~ COST_REGEXP)
    end
  end
end
