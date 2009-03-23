
require 'rext/string'

describe String do
  describe "helpers" do
    
    describe "#path" do
      it "should return an instance of a pathname" do
        'History.rdoc'.path.should be_an_instance_of(Pathname)
      end
    end
    
    describe "#files" do
      it "should return result of Dir glob" do
        'lib/*.*'.files.should be_an_instance_of(Array)
      end
    end
    
    describe "#file" do
      it "should return an instance of a file" do
        'History.rdoc'.file.should be_an_instance_of(File)
      end
    end
        
    describe "#add_class" do
      it "should add a word that does not exist" do
        'foo'.add_class('bar').should == 'foo bar'
      end
      
      it "should not add the same word twice" do
        'foo-bar bar'.add_class('bar').should == 'foo-bar bar'
      end
    end
    
    describe "#wrap" do
      it "should wrap a string" do
        'foo'.wrap('|').should == '|foo|'
      end
      
      it "should wrap with optional suffix" do
        'foo'.wrap('(', ')').should == '(foo)'
      end
    end
    
    describe "#start_with?" do
      it "should check if a string starts with another" do
        'foo bar'.start_with?('foo').should be_true
        ' foo bar'.start_with?('foo').should_not be_true
        'bar foo'.start_with?('foo').should_not be_true
      end
    end
    
    describe "#end_with?" do
      it "should check if a string ends with another" do
        'foo bar'.end_with?('bar').should be_true
        'foo bar '.end_with?('bar').should_not be_true
        'bar foo foo'.end_with?('foo').should be_true
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