require 'spec_helper'

class DummyCell < Juicy::Cells::Base
end

describe Juicy::Cells::Base do
  subject { DummyCell.new(report, value, options) }
  let(:report) { double(:report) }
  let(:value) { double(:value, to_s: 'the value') }
  let(:options) { {option: :value} }

  describe "#initializer" do
    it "receives a report, value and options as params" do
      expect(subject.report).to eq(report)
      expect(subject.value).to eq(value)
      expect(subject.options).to eq(options)
    end
  end

  describe "#to_s" do
    it "delegates #to_s to the given value" do
      expect(subject.to_s).to eq('the value')
    end
  end

end