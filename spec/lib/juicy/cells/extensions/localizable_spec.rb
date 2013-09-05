require 'spec_helper'

class DummyLocalized
  include Juicy::Cells::Extensions::Localizable

  attr_accessor :value, :options

  def initialize(value, options = nil)
    @value = value
    @options = options
  end
end

describe Juicy::Cells::Extensions::Localizable do

  it "inherits from ActionView::Helpers::TranslationHelper" do
    expect(described_class).to include(ActionView::Helpers::TranslationHelper)
  end

  it "localizes #to_s" do
    subject = DummyLocalized.new(Date.today)
    expect(subject.to_s).to eq(subject.l(Date.today))
  end

  it "localizes #to_s according to the given options" do
    options = { format: :short }
    subject = DummyLocalized.new(Date.today, options)
    expect(subject.to_s).to eq(subject.l(Date.today, options))
  end

end