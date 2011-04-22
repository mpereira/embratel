# encoding: utf-8

module Embratel
  module CSVParser
    extend self

    def parse(path)
      rows = CSV.read(path, { :skip_blanks => true })
    rescue Errno::ENOENT, Errno::EISDIR, CSV::MalformedCSVError
      raise
    else
      if File.extname(path) != '.csv'
        raise NonCSVFileError
      else
        # Skipping title and header lines.
        2.times { rows.shift }
        invalid_rows, calls, fees = [], [], []
        rows.each_with_index do |row, index|
          if (call = Call.new(row)).valid?
            calls << call
          elsif (fee = Fee.new(row)).valid?
            fees << fee
          else
            invalid_rows << index + 4
          end
        end
        if invalid_rows.empty?
          calls + fees
        else
          raise InvalidRowsError, invalid_rows_error_message(invalid_rows)
        end
      end
    end

    private

    def invalid_rows_error_message(rows)
      rows.
        join(', ').
        insert(0, rows.size == 1 ? 'Erro na linha ' : 'Erro nas linhas ')
    end
  end
end
