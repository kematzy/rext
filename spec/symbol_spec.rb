
require File.dirname(__FILE__) + '/spec_helper'
require 'rext/symbol'

describe Symbol do
  describe "helpers" do
    describe "#to_proc" do
      it "should return a proc" do
        :foo.to_proc.should be_a(Proc)
        ['foo', 'bar'].map(&:length).should == [3, 3]
      end
    end
  end
end