
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
    
    describe "#chunk" do
      it "should split an array into several containing the length of n" do
        (1..9).to_a.chunk(3).should == [[1,2,3], [4,5,6], [7,8,9]]
      end
      
      it "should accept a block, yielding each chunk" do
        chunks = []
        (1..9).to_a.in_groups_of(3) do |chunk|
          chunks << chunk
        end
        chunks.should == [[1,2,3], [4,5,6], [7,8,9]]
      end
    end
    
  end
end