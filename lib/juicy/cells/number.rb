module Juicy
  module Cells
    class Number < Base
      include Juicy::Cells::Extensions::Number

      def value
        super.to_f
      end
    end
  end
end