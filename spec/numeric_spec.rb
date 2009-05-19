
require 'rext/numeric'

describe Numeric do
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
  
  describe "bytes" do
    it "should return bytes, kilobytes, megabytes, gigabytes, and terabytes" do
      5.bytes.should == 5
      5.kilobytes.should == 5120
      5.megabytes.should == 5242880
      5.gigabytes.should == 5368709120
      5.terabytes.should == 5497558138880
    end
  end
end