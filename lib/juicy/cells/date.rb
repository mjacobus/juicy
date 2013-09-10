module Juicy
  module Cells
    class Date < Base
      include Juicy::Cells::Extensions::Localizable

      def value=(value)
        unless value.is_a?(Date)
          value = ::Date.parse(value)
        end
        @value = value
      end
    end
  end
end