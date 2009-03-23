
require 'rext/integer'

describe Integer do
  describe "time" do
    
    describe "#ago / #before" do
      it "should return the distance in time before now, or specified time" do
        event = Time.mktime 1987, 5, 25
        15.days.before(event).should == Time.mktime(1987, 5, 10)
      end
    end

    describe "#since / #from_now" do
      it "should return the distance in time from now, or specified time" do
        event = Time.mktime 1987, 5, 25
        5.days.since(event).should == Time.mktime(1987, 5, 30)
      end
    end
    
  end
end