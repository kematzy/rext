
require 'rext/class'

describe Class do
  describe "helpers" do
    
    describe "#chain" do
      it "should allow chaining via super" do
        class Foo
          def method_missing meth
            if meth.to_s =~ /^say_(\w+)/
              "said #{$1}"
            else
              super
            end
          end
        end
        
        class Foo
          chain {
            def method_missing meth
              if meth.to_s =~ /^ask_for_(\w+)/
                "asked for #{$1}"
              else
                super
              end
            end
          }
        end
        
        Foo.new.ask_for_array.should == 'asked for array'
        Foo.new.say_hello.should == 'said hello'
        lambda { Foo.new.does_not_exist }.should raise_error(NoMethodError)
      end
    end
    
  end
end