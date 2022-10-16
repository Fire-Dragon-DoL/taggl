TestBench.activate

require "pry-byebug" rescue nil

$LOAD_PATH.unshift(File.expand_path("../lib/taggl", __dir__))

require "taggl"
require "taggl/controls"

include Taggl

require "csv"
require "tty-table"

class TestMatrix
  module CSV
    extend self

    def assert(path, indent: nil, &block)
      assert_matrix(TestMatrix.new, path, indent: indent, &block)
    end

    def assert_colored(path, indent: nil, &block)
      assert_matrix(TestMatrix.terminal_colored, path, indent: indent, &block)
    end

    private

    def assert_matrix(matrix, path, indent: nil, &block)
      enumerator = ::CSV.
        foreach(path).
        lazy.
        with_index.
        map do |row, row_index|
          # headers
          if row_index.zero?
            next row.map { |val| val || "" }
          end

          # rows
          row.each.with_index.map do |cell, cell_index|
            next cell if cell_index.zero?

            TestMatrix.string_to_bool(cell)
          end
        end
      enumerator = enumerator.eager

      matrix.assert(enumerator, indent: indent, &block)
    end
  end

  def self.string_to_bool(text)
    case text
    when "TRUE" then true
    when "FALSE" then false
    else
      raise ArgumentError, "Unknown string #{text}"
    end
  end

  def self.terminal_colored
    new(success_text: "\033[32m✓\033[0m", failure_text: "\033[31m✗\033[0m")
  end

  def self.assert(...)
    new.assert(...)
  end

  def self.assert_colored(...)
    terminal_colored.assert(...)
  end

  def initialize(success_text: nil, failure_text: nil)
    success_text ||= "✓"
    failure_text ||= "✗"
    @stxt = success_text 
    @ftxt = failure_text
  end

  # Compares all values in enumerable and verify the expected comparison is successful
  # @param enumerable [#each] Enumerable of enumerables [
  #     [String...] headers,
  #     [#to_s, Boolean, Boolean...] subject + results
  #   ]
  # @param indent [Integer] level of indentation to render the table
  # @yieldparam subject_text [#to_s] first cell of row
  # @yieldparam header_text [#to_s] column header for the current cell
  # @yieldreturn [Boolean] true if comparison is successful, false otherwise
  # @return [(String, Boolean)] tuple, first element is a string representing
  #   matrix comparisons, second value is true if all matrix test succeeded,
  #   false otherwise
  def assert(enumerable, indent: nil, &block)
    indent ||= 0
    success = true
    output = []

    headers = nil
    enumerable.each.with_index do |row, row_index|
      if row_index.zero?
        headers = row.each.to_a
        next
      end

      subject = nil
      output_row = []
      row.each.with_index do |cell, column_index|
        if column_index.zero?
          subject = cell
          output_row << subject
          next
        end

        header = headers[column_index]

        expected = cell
        actual = block.(subject, header)

        output_text = @stxt
        if expected != actual
          output_text = @ftxt
          success = false
        end

        output_row << output_text
      end

      output << output_row
    end

    binding.pry
    table = TTY::Table.new(header: headers, rows: output)
    binding.pry
    # text_output = table.render(
    #   :unicode,
    #   alignments: headers.map { :center },
    #   indent: indent,
    #   column_widths: 20
    # )
    text_output = table.render(:basic)

    return text_output, success
  end
end
