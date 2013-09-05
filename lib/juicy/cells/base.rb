module Juicy
  module Cells
    class Base
      attr_reader :report, :value, :options, :column_id

      def initialize(report, value, options = {}, column_id = nil)
        @report  = report
        @value   = value
        @options = options
        @column_id = column_id
      end

      def to_s
        value.to_s
      end

    end
  end
end