require 'spec_helper'

class DummyNumber
  include Juicy::Cells::Extensions::Number

  attr_accessor :value, :options

  def initialize(value, options = nil)
    @value = value
    @options = options
  end
end

describe Juicy::Cells::Extensions::Number do
  let(:value) { 123456789.585 }

  it "inherits from ActionView::Helpers::NumberHelper" do
    expect(described_class).to include(ActionView::Helpers::NumberHelper)
  end

  it "localizes #to_s" do
    subject = DummyNumber.new(value)
    expect(subject.to_s).to eq(subject.number_with_delimiter(value))
  end

  it "localizes #to_s according to the given options" do
    options = { separator: ':' }
    subject = DummyNumber.new(value, options)
    expect(subject.to_s).to eq(subject.number_with_delimiter(value, options))
  end

end