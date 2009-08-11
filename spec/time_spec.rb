
require File.dirname(__FILE__) + '/spec_helper'
require 'rext/time'

describe Time do
  describe "helpers" do
    describe "#in_words_since" do
      it "should convert time lost to words" do
        event = Time.now - 5.seconds
        event.in_words_since_now.should == 'less than one minute'
        event -= 1.minute
        event.in_words_since_now.should == 'one minute'
        event -= 2.minutes
        event.in_words_since_now.should == '3 minutes'
        event -= 5.years
        event.in_words_since_now.should == '5 years'
        event -= 100.years
        event.in_words_since_now.should == 'hundreds of years'
      end
    end
  end
end