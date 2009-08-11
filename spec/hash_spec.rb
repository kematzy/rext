
require File.dirname(__FILE__) + '/spec_helper'
require 'rext/hash'

describe Hash do
  describe "helpers" do
    describe "#delete_at" do
      it "should delete several keys, returning their values when present" do
        options = { :foo => 1, :bar => 2 }
        foo, bar, does_not_exist = options.delete_at :foo, :bar, :does_not_exist
        foo.should == 1
        bar.should == 2
        does_not_exist.should be_nil
      end
    end
    
    describe "#switchify" do
      it "should work with bools" do
        { :use_foobar => true }.switchify.should == ['--use-foobar']
        { :use_foobar => false }.switchify.should be_empty
      end
      
      it "should stringify numbers and symbols" do
        { :interval => 15, :icon => :jpeg }.switchify.sort.should == ['--icon', '--interval', '15', 'jpeg']
      end
      
      it "should work with little switches" do
        { :T => true }.switchify.should == ['-T']
      end
      
      it "should add quotes around strings" do
        { :glob => 'lib/**/*.rb' }.switchify.should == ['--glob', '"lib/**/*.rb"']
      end
    end
  end  
end