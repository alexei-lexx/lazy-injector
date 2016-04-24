require 'spec_helper'
require 'ostruct'

describe LazyInjector do
  context 'when LazyInjector is included in MyDependencies' do
    before do
      stub_const 'MyDependencies', Module.new

      module MyDependencies
        include LazyInjector
      end
    end

    context 'and a dependency is registered' do
      let(:tester) { Object.new.extend MyDependencies }

      before do
        module MyDependencies
          register :my_database do
            OpenStruct.new(name: 'my database')
          end
        end
      end

      it 'makes the dependency available in the tester' do
        expect(tester).to respond_to :my_database
      end

      it 'assigns the proper value of dependency' do
        expect(tester.my_database.name).to eq 'my database'
      end

      context 'when the dependency is not used' do
        it "doesn't initialize it" do
          expect(OpenStruct).not_to receive(:new)
        end
      end

      context 'when the dependency is used twice' do
        it 'initializes it once' do
          expect(OpenStruct).to receive(:new).once
          2.times { tester.my_database }
        end
      end
    end
  end
end
