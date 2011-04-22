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
            invalid_rows << index + 1
          end
        end
        if invalid_rows.empty?
          calls + fees
        else
          raise InvalidRowsError, "Erro nas linhas #{invalid_rows.join(', ')}"
        end
      end
    end
  end
end
