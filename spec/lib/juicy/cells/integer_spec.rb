require 'spec_helper'

describe Juicy::Cells::Integer do

  it "inherits from Juicy::Cells::Base" do
    expect(described_class.ancestors).to include(Juicy::Cells::Base)
  end

  it "inherits from Juicy::Cells::Extensions::Number" do
    expect(described_class.ancestors).to include(Juicy::Cells::Extensions::Number)
  end

  it "converts value to float" do
    subject = described_class.new(double(:report), '1.585')
    expect(subject.value).to eq(1)
  end
end