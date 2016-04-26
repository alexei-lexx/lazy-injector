require 'lazy_injector/version'

module LazyInjector
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def register(name, &block)
      define_method name do
        @lazy_injector ||= {}

        if @lazy_injector.key?(name)
          @lazy_injector[name]
        else
          @lazy_injector[name] = block && instance_eval(&block)
        end
      end
    end
  end
end
