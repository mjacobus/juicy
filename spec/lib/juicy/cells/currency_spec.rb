require 'spec_helper'

describe Juicy::Cells::Currency do
  let(:report) { double(:report) }
  let(:value)  { 123456.78 }

  subject { described_class.new(report, value) }

  it "inherits from Juicy::Cells::Number" do
    expect(described_class.ancestors).to include(Juicy::Cells::Number)
  end

  it "localizes #to_s" do
    expect(subject.to_s).to eq(subject.number_to_currency(value))
  end

  it "localizes #to_s according to the given options" do
    options = { unit: '$@$' }
    subject.stub(:options).and_return(options)
    expect(subject.to_s).to eq(subject.number_to_currency(value, options))
  end

end