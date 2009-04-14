
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
      
      it "should pad with nil by default" do
        (1..5).to_a.in_groups_of(4).should == [[1,2,3,4], [5,nil,nil,nil]]
      end
    end
    
    describe "#pad" do
      it "should pad with nil by default" do
        [1,2].pad(4).should == [1, 2, nil, nil]
      end
      
      it "should pad an with an object" do
        [1,2].pad(3 ,'x').should == [1, 2, 'x']
      end
      
      it "should do nothing when the array is of expected length" do
        [1,2].pad(2).should == a
      end
    end
    
  end
end