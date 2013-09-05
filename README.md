# Juicy

Juicy is gem that attempts to easy the report making

## Installation

Add this line to your application's Gemfile:

    gem 'juicy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install juicy

## Usage

```ruby
report = Juicy::Report.new

report.add_column [:name, 'Employee'], :number
report.add_column :salary, :currency, { unit: 'R$ ', separator: ',', delimiter: '.' }

report.add_row('Foo', 1500)
report.add_row('Bar', 1234.56)

report.to_a # =>
# [
#   ['Employee', 'Salary'],
#   ['Foo', 'R$ 1.500,00'],
#   ['Bar', 'R$ 1.234,56'],
# ]


# Adding footer
total = lambda{|report| report.cells(1).map(&:value).inject(:+) } # you could format the currency here, but you got the idea
report.footer = ['Total', total]

report.to_a # =>
# [
#   ['Employee', 'Salary'],
#   ['Foo', 'R$ 1.500,00'],
#   ['Bar', 'R$ 1.234,56'],
#   ['Total', '2734.56'],
# ]

```

### Rendering the report
@TODO: Implement

```ruby
ReportRenderer::Html.new(report).render # TODO: Implement
ReportRenderer::Pdf.new(report).render  # TODO: Implement
ReportRenderer::Xls.new(report).render  # TODO: Implement
```

### Implementing your own renderer
@TODO: Create doc

## Cell types
@TODO: Create doc

## Creating custom cell types
@TODO: Create doc

## TODO
- Create a sweet DSL
- Create renders
- Create custom Cell type that calculates its value based on the other cells values

## Author
- [Marcelo Jacobus](https://github.com/mjacobus)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
