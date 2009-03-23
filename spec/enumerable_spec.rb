
require 'rext/enumerable'

describe Enumerable do
  
  
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