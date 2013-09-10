require 'spec_helper'

describe Juicy::Cells::Date do

  it "inherits from Juicy::Cells::Base" do
    expect(described_class.ancestors).to include(Juicy::Cells::Base)
  end

  it "inherits from Juicy::Cells::Extensions::Localizable" do
    expect(described_class.ancestors).to include(Juicy::Cells::Extensions::Localizable)
  end

  it "parses date when string is given" do
    subject = described_class.new('report', '2001-01-02')
    expect(subject.value).to be_a(Date)
  end
end