
require 'rext/array'

describe Array do
  describe "helpers" do
    
    before :each do
      @items = %w( some foo bar )  
    end
    
    describe "#from" do
      it "should return elements after the position specified" do
        @items.from(1).should == %w( foo bar )
      end
    end
    
    describe "#to" do
      it "should return elements up to position" do
        @items.to(1).should == %w( some foo )
      end
    end
    
  end
end