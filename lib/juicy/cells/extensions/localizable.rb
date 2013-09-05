require 'rails'
require 'action_view'

module Juicy
  module Cells
    module Extensions
      module Localizable
        include ActionView::Helpers::TranslationHelper

        def to_s
          l(value, options)
        end
      end
    end
  end
end