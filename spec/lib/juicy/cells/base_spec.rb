require 'spec_helper'

class DummyCell < Juicy::Cells::Base
end

describe Juicy::Cells::Base do
  subject { DummyCell.new(report, value, options, column_id) }
  let(:report) { double(:report) }
  let(:value) { double(:value, to_s: 'the value') }
  let(:options) { {option: :value} }
  let(:column_id) { :column_id }

  describe "#initializer" do
    it "receives a report, value and options as params" do
      expect(subject.report).to eq(report)
      expect(subject.value).to eq(value)
      expect(subject.options).to eq(options)
      expect(subject.column_id).to eq(column_id)
    end
  end

  describe "#to_s" do
    it "delegates #to_s to the given value" do
      expect(subject.to_s).to eq('the value')
    end
  end

  it { should respond_to(:value=) }
  it { should respond_to(:options=) }
  it { should respond_to(:column_id=) }

end