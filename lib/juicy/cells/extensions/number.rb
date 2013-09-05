require 'rails'
require 'action_view'

module Juicy
  module Cells
    module Extensions
      module Number
        include ActionView::Helpers::NumberHelper

        def to_s
          number_with_delimiter(value, options || {})
        end
      end
    end
  end
end

