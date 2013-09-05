require 'spec_helper'

describe Juicy::Cells::Date do

  it "inherits from Juicy::Cells::Base" do
    expect(described_class.ancestors).to include(Juicy::Cells::Base)
  end

  it "inherits from Juicy::Cells::Extensions::Localizable" do
    expect(described_class.ancestors).to include(Juicy::Cells::Extensions::Localizable)
  end
end