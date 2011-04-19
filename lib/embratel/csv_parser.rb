# encoding: utf-8

module Embratel
  module CSVParser
    extend self

    def parse(path)
      rows = CSV.read(path, { :skip_blanks => true })
    rescue Errno::ENOENT, Errno::EISDIR, CSV::MalformedCSVError
      raise
    else
      if !csv?(path)
        raise NonCSVFileError
      else
        # Skipping title and header lines.
        2.times { rows.shift }
        invalid_rows, calls = [], []
        rows.each_with_index do |row, index|
          if !(call = Call.new(row)).valid?
            invalid_rows << index + 1
          else
            calls << call
          end
        end
        if !invalid_rows.empty?
          raise InvalidRowsError, "Erro nas linhas #{invalid_rows.join(', ')}"
        else
          calls
        end
      end
    end

    def csv?(path)
      File.extname(path) == '.csv'
    end
  end
end
