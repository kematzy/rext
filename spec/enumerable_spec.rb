
require 'rext/enumerable'

describe Enumerable do
  describe "helpers" do
    describe "#group_by" do
      before :each do
        @enum = 'foo', :bar, 1, 2, 3
        @results = {
          String => ['foo'],
          Symbol => [:bar],
          Fixnum => [1, 2, 3]
        }
      end
      
      it "should group an enum" do
        @enum.group_by { |v| v.class }.should == @results
      end
      
      it "should group using instance evaluated block" do
        @enum.group_by { self.class }.should == @results
      end
      
      it "should group by method call" do
        @enum.group_by.class.should == @results
      end
    end
    
    describe "#every" do
      it "should map a method call" do
        list = %w( cookies icecream sugar )
        list.every.length.should == [7, 8 ,5]
      end

      it "should allow mapping shortcuts using a block" do
        people = []
        people << mock('Person', :name => 'TJ')
        people << mock('Person', :name => 'Scott')
        people.every { name.length }.should == [2, 5]
      end
    end
  end
end