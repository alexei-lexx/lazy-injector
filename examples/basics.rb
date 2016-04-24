require 'lazy_injector'
require 'ostruct'

module Parts
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
end

module Dependencies
  include LazyInjector
  include Parts

  register :car do
    OpenStruct.new(engine: engine, wheels: wheels)
  end
end

include Dependencies

p car
