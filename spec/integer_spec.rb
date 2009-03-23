
require 'rext/integer'

describe Integer do
  describe "helpers" do
    describe "#ordanalize" do
      it "should convert integers to an ordanal string" do
        1.ordinalize.should == '1st'
        2.ordinalize.should == '2nd'
        3.ordinalize.should == '3rd'
        4.ordinalize.should == '4th'
        11.ordinalize.should == '11th'
        12.ordinalize.should == '12th'
        13.ordinalize.should == '13th'
      end
    end
  end
  
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