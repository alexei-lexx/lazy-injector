# LazyInjector

Use Lazy Injector to define dependencies and inject them into your code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lazy_injector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lazy_injector

## Usage

```ruby
require 'lazy_injector'
require 'ostruct'

module Dependencies
  include LazyInjector

  register(:wheel_factory) { Struct.new(:axle, :side) }

  register :wheels do
    [
      wheel_factory.new('front', 'left'),
      wheel_factory.new('front', 'right'),
      wheel_factory.new('rear', 'left'),
      wheel_factory.new('rear', 'right')
    ]
  end

  register(:engine) { OpenStruct.new }

  register :car do
    OpenStruct.new(engine: engine, wheels: wheels)
  end
end

include Dependencies

p car
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lazy_injector.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
