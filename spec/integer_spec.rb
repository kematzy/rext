
require File.dirname(__FILE__) + '/spec_helper'
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
end