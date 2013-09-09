require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
  add_group 'juicy', 'lib/juicy'
end

require 'juicy'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end