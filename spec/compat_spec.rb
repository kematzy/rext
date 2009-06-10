
require 'rext/compat'

describe Rext do
  describe "compatibility" do
    describe BasicObject do
      
      before :each do
        @object = BasicObject.new  
      end
      
      it "should have no methods" do
        lambda { @object.send }.should raise_error(NoMethodError)
      end
      
      it "should preserve __* methods" do
        lambda { @object.__send__ }.should_not raise_error(NoMethodError)
      end

    end
  end
end