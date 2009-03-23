
require 'rext/string'

describe String do

  describe "helpers" do
    describe "#wrap" do
      it "should wrap a string" do
        'foo'.wrap('|').should == '|foo|'
      end
      
      it "should wrap with optional suffix" do
        'foo'.wrap('(', ')').should == '(foo)'
      end
    end
    
    describe "#start_with?" do
      it "should check if a string starts with a string" do
        'foo bar'.start_with?('foo').should be_true
        ' foo bar'.start_with?('foo').should_not be_true
        'bar foo'.start_with?('foo').should_not be_true
      end
    end
  
    describe "#plural?" do
      it "should check if a string is plural" do
        'cookies'.should be_plural
        'cookie'.should_not be_plural
      end
    end
  
    describe "#singular?" do
      it "should check if a string is singular" do
        'cookie'.should be_singular
        'cookies'.should_not be_singular
      end
    end
  
    describe "#first" do
      it "should return the first character" do
        'foo'.first.should == 'f'
      end
    end
  
    describe "#last" do
      it "should return the last character" do
        'bar'.last.should == 'r'
      end
    end
  
    describe "#digitize" do
      it "should leave only numeric characters" do
        '$100,000'.digitize.should == '100000'
        '$100,000'.digitize.to_i.should == 100_000
      end
    end
  end
  
end