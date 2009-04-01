
require 'rext/object'

describe Object do
  describe "metaclass" do
    describe "#metaclass" do
      it "should return the anonymous 'virtual' class" do
        'foo'.metaclass.should be_an_instance_of(Class)
      end
    end
    
    describe "#meta_eval" do
      it "should evaluate a block in context to the metaclass" do
        object = 'foo'
        object.meta_eval do
          define_method :foo do
            'bar'
          end
        end
        object.foo.should == 'bar'
      end
      
      it "should accept a string to be evaluated" do
        object = 'foo'
        object.meta_eval <<-EOF
          def foo
            'bar'
          end
        EOF
        object.foo.should == 'bar'
      end
    end
    
    describe "#meta_def" do
      it "should define a method within the metaclass" do
        object = 'foo'
        object.meta_def(:foo) { |*args| "bar #{ args.join(', ') }" }
        object.foo(1,2,3).should == 'bar 1, 2, 3'
      end
    end
  end
  
  describe "helpers" do
    describe "#indifferent_hash" do
      it "should return a hash indifferent to symbols or strings for key access" do
        hash = indifferent_hash
        hash['foo'] = 'foo'
        hash[:foo].should == 'foo'
        hash['foo'].should == 'foo'
      end
    end
  end
end