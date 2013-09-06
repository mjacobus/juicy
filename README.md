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
total = lambda{|report| report.cells(1).map(&:value).inject(:+) }
report.footer = ['Total', total]

report.to_a # =>
# [
#   ['Employee', 'Salary'],
#   ['Foo', 'R$ 1.500,00'],
#   ['Bar', 'R$ 1.234,56'],
#   ['Total', '2734.56']
# ]

# you could have formated the total currency here, but you got the idea

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

### Overriting a cell type class

#### Method 1
Inform the default factory

```ruby
class UpperCaseString < Juicy::Cells::Base
  def value
    super(value)
  end

  def to_s
    value.uppercase
  end
end

Juicy::Cells::Factory.define_type_class(:string, UpperCaseString)
```

#### Method 2
Override the factory

```ruby
report = new Juicy::Report(MyTypeFactory.new)
```

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
