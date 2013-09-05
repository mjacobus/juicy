module Juicy
  module Errors
    class ReportColumnTaken < StandardError
      def initialize(column_id)
        super("Column with id '#{column_id}' was already taken")
      end
    end
  end
end