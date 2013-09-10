module Juicy
  module Cells
    class Date < Base
      include Juicy::Cells::Extensions::Localizable

      def value=(value)
        if value.is_a?(Date)
          @value = value
        else
          @value = ::Date.parse(value.to_s)
        end
      end
    end
  end
end