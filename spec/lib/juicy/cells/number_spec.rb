require 'spec_helper'

describe Juicy::Cells::Number do

  it "inherits from Juicy::Cells::Base" do
    expect(described_class.ancestors).to include(Juicy::Cells::Base)
  end

  it "inherits from Juicy::Cells::Extensions::Number" do
    expect(described_class.ancestors).to include(Juicy::Cells::Extensions::Number)
  end
end