module Juicy
  module Cells
    class Factory
      @@classes = {}

      def create(value, report, cell_index)
        definition = report.column_definition(cell_index)
        klass = self.class.type_class(definition[:type])
        klass.new(report, value, definition[:options], definition[:id])
      end


      def self.define_type_class(type, klass)
        @@classes[type] = klass
      end

      def self.type_class(type)
        klass = @@classes[type]

        unless klass
          begin
            klass = "Juicy::Cells::#{type.to_s.titleize.gsub('_', '')}".constantize
          rescue
            raise Juicy::Errors::UnkownCellType.new(type)
          end
        end

        klass
      end

      def self.reset_classes
        @@classes = {}
      end

    end
  end
end