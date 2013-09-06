module Juicy
  class Report
    attr_reader :column_definitions, :column_ids, :factory, :current_row, :rows
    attr_accessor :footer

    def initialize(factory = Juicy::Cells::Factory.new)
      @column_definitions = []
      @column_ids = []
      @rows = []
      @factory = factory
      @current_row = 0
      @footer = nil
    end

    def add_column(id, type, options = nil)
      if id.is_a?(Array)
        id, label =  id.first, id.last
      else
        label = id.to_s.titleize
      end

      add_column_id(id)
      definition = { id: id, type: type, options: options, label: label }
      @column_definitions << definition
    end

    def column_definition(id)
      if id.is_a?(Fixnum)
        column_definitions[id]
      else
        column_definitions.select{|d| d[:id] == id}.first
      end
    end

    def add_row(*values)
      cells = []
      values.each_with_index do |value, index|
        @current_row = index
        cells << factory.create(value, self, index)
      end
      @rows << cells
    end

    def cell(row_index, cell_index)
      cells = rows[row_index]
      if cell_index.is_a?(Fixnum)
        cells[cell_index]
      else
        cells.select{|c| c.column_id == cell_index}.first
      end
    end

    def cells(column_id)
      if column_id.is_a?(Fixnum)
        rows.map{|r| r[column_id]}
      else
        rows.map{|r| r.select{|c| c.column_id == column_id}.first }
      end
    end

    # TODO: Dry, move to a module
    def to_a
      a = []
      a << column_definitions.map{|d| d[:label] }
      rows.each {|cells| a << cells.map(&:to_s) }
      if footer
        a << footer.map do |element|
          element.respond_to?(:call) ? element.call(self) : element
        end
      end
      a
    end

    # TODO: Dry, move to a module
    def to_hash
      hash = { header: [], rows: [], footer: []}
      hash[:header] = column_definitions.map{|d| d[:label] }
      rows.each {|cells| hash[:rows] << cells.map(&:to_s) }
      if footer
        hash[:footer] = footer.map do |element|
          element.respond_to?(:call) ? element.call(self) : element
        end
      end
      hash
    end

    private
      def add_column_id(id)
        if column_ids.include?(id)
          raise Juicy::Errors::ReportColumnTaken.new(id)
        else
          @column_ids << id
        end
      end

  end
end