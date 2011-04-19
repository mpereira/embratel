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
        error_messages, calls = [], []
        rows.each_with_index do |row, index|
          if !(call = Call.new(row)).valid?
            error_messages << "erro: a linha #{index + 1} é inválida"
          else
            calls << call
          end
        end
        if !error_messages.empty?
          raise InvalidRowsError, error_messages.join("\n")
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
