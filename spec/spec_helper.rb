require 'simplecov'

SimpleCov.start do
  add_filter 'spec'
  add_group 'Juicy', 'lib/juicy'
  add_group 'Cells', 'lib/juicy/cells'
end

require 'juicy'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end