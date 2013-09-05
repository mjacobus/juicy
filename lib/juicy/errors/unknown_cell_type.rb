module Juicy
  module Errors
    class UnkownCellType < StandardError
      def initialize(type)
        super("Unknown cell type '#{type}'")
      end
    end
  end
end