
require 'rext/integer'

describe Integer do
  describe "time" do
    
    describe "#ago / #before" do
      it "should return the distance in time before now, or specified time" do
        event = Date.parse 'may 25th 1987'
        15.days.before(event).should == Date.parse('may 15th 1987')
      end
    end

    describe "#since / #from_now" do
      it "should return the distance in time from now, or specified time" do
        event = Date.parse 'may 25th 1987'
        5.days.since(event).should == Date.parse('may 30th 1987')
      end
    end
    
  end
end