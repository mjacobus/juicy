module Juicy
  module Cells
    class Integer < Base
      include Juicy::Cells::Extensions::Number

      def value
        super.to_i
      end
    end
  end
end