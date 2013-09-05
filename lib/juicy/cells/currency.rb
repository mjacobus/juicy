module Juicy
  module Cells
    class Currency < Number

      def to_s
        number_to_currency(value, options)
      end

    end
  end
end