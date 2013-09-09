require 'spec_helper'

describe Juicy::Report do

  describe "column definitions" do
    before do
      subject.add_column [:first, 'Custom Label'], :number
      subject.add_column :second,  :string, {option: :value}
    end

    it "sets the column_definitions" do
      definitions = [
        {id: :first, type: :number, options: nil, label: 'Custom Label' },
        {id: :second,  type: :string, options: {option: :value}, label: 'Second' }
      ]
      expect(subject.column_definitions).to eq(definitions)
    end

    it "gets column definition by column id" do
      definition = {id: :first, type: :number, options: nil, label: 'Custom Label' }
      expect(subject.column_definition(:first)).to eq(definition)

      definition = {id: :second,  type: :string, options: {option: :value}, label: 'Second' }
      expect(subject.column_definition(:second)).to eq(definition)
    end

    it "gets column definition by column index" do
      definition = {id: :first, type: :number, options: nil, label: 'Custom Label' }
      expect(subject.column_definition(0)).to eq(definition)

      definition = {id: :second,  type: :string, options: {option: :value}, label: 'Second' }
      expect(subject.column_definition(1)).to eq(definition)
    end

    it "adds the ids to a collection" do
      expect(subject.column_ids).to eq([:first, :second])
    end

    it "raises error when column id was already taken" do
      message = "Column with id 'first' was already taken"
      expect do
        subject.add_column :first, :number
      end.to raise_error(Juicy::Errors::ReportColumnTaken, message)
    end

  end

  describe "#add_row" do
    it "adds rows containing cells acording to the definitions given" do
      subject.add_column(:name, :string)
      subject.add_column(:age, :number)

      subject.add_row('Foo', 20)
      subject.add_row('Bar', 30)

      # first cell
      first = subject.cell(0, 0)
      expect(first).to be_a(Juicy::Cells::String)
      expect(first.value).to eq('Foo')
      expect(subject.cell(0, :name)).to be(first)

      # # second cell
      second = subject.cell(0, 1)
      expect(second).to be_a(Juicy::Cells::Number)
      expect(second.value).to eq(20)
      expect(subject.cell(0, :age)).to be(second)

      # # third cell
      third = subject.cell(1, 0)
      expect(third).to be_a(Juicy::Cells::String)
      expect(third.value).to eq('Bar')
      expect(subject.cell(1, :name)).to be(third)

      # fourth cell
      fourth = subject.cell(1, 1)
      expect(fourth).to be_a(Juicy::Cells::Number)
      expect(fourth.value).to eq(30)
      expect(subject.cell(1, :age)).to be(fourth)
    end
  end

  describe "convertes" do

    before do
      subject.add_column [:name, 'Employee'], :string
      subject.add_column :salary, :currency, { unit: 'R$ ', separator: ',', delimiter: '.' }

      subject.add_row('Foo', 1500)
      subject.add_row('Bar', 1234.56)

      sum = Proc.new do |report|
        total = report.cells(1).map(&:value).inject(:+)
        report.cell(0,1).number_to_currency(total, { unit: 'R$ ', separator: ',', delimiter: '.' })
      end

      subject.footer = ['Total', sum]
    end

    describe "#to_a" do
      it "converts rows to array" do
        expected = [
          ['Employee', 'Salary'],
          ['Foo', 'R$ 1.500,00'],
          ['Bar', 'R$ 1.234,56'],
          ['Total', 'R$ 2.734,56'],
        ]

        expect(subject.to_a).to eq(expected)
      end

    end

    describe "#to_hash" do
      it "converts to hash" do
        expected = {
          header: ['Employee', 'Salary'],
          rows: [
            ['Foo', 'R$ 1.500,00'],
            ['Bar', 'R$ 1.234,56'],
          ],
          footer: ['Total', 'R$ 2.734,56']
        }

        expect(subject.to_hash).to eq(expected)
      end
    end
  end

  describe "#cells" do

    before do
      subject.add_column [:name, 'Employee'], :string
      subject.add_column :salary, :currency, { unit: 'R$ ', separator: ',', delimiter: '.' }

      subject.add_row('Foo', 1000)
      subject.add_row('Bar', 2000)
    end

    it "gets all the column values by id" do
      expect(subject.cells(:name).map(&:value)).to eq(['Foo', 'Bar'])
    end

    it "gets all the column values by index" do
      expect(subject.cells(1).map(&:value)).to eq([1000, 2000])
    end
  end

end