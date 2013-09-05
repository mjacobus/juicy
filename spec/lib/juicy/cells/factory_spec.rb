require 'spec_helper'

class DummyTypeClass
end

describe Juicy::Cells::Factory do

  after { described_class.reset_classes }

  describe "#create" do
    it "creates according to the column definition" do
      report = double(:report)
      report.should_receive(:column_definition).with(0).and_return({
        id: :id, type: :number, options: { option: :value }
      })

      created = described_class.new.create(1, report, 0)

      expect(created).to be_a(Juicy::Cells::Number)
      expect(created.column_id).to eq(:id)
    end
  end

  describe ".define_type_class" do
    it "define a type class" do
      described_class.define_type_class(:string,  DummyTypeClass)
      klass = described_class.type_class(:string)
      expect(klass).to be(DummyTypeClass)
    end
  end

  describe ".type_class" do
    it "returns the default type class when no custom class has been defined" do
      klass = described_class.type_class(:string)
      expect(klass).to be(Juicy::Cells::String)
    end

    it "raises error when type is not defined" do
      expect do
        described_class.type_class(:unknown_type)
      end.to raise_error(Juicy::Errors::UnkownCellType, "Unknown cell type 'unknown_type'")
    end
  end
end