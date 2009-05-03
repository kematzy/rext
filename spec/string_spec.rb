
require 'rext/string'

describe String do
  describe "helpers" do
    
    describe "#word_frequency" do
      it "should return a hash with word keys and count values" do
        'mm i love cookies mm'.word_frequency.
        should == {
          'mm' => 2,  
          'i' => 1,  
          'love' => 1,  
          'cookies' => 1,  
        }
      end
    end
    
    describe "#frequency_of_word" do
      it "should return the frequency of a word, or 0" do
        'yum yum ? yes'.frequency_of_word('yum').should == 2
        'yum yum ? yes'.frequency_of_word('yes').should == 1
        'yum yum ? yes'.frequency_of_word('no').should == 0
      end
    end
    
    describe "#switchify" do
      it "should return a switch version of the string" do
        'some_foo_bar'.switchify.should == '--some-foo-bar'
      end
      
      it "should return small switches when only a single char" do
        't'.switchify.should == '-t'
      end
      
      it "should raise an InvalidSwitchError when length 0" do
        lambda { ''.switchify }.should raise_error(String::InvalidSwitchError)
      end
    end
    
    describe "#base64_encode" do
      it "should base64 encode a string" do
        'tj'.base64_encode.should == 'dGo='
        "foo \n bar\n\n".base64_encode.base64_decode.should == "foo \n bar\n\n"
      end
    end
    
    describe "#base64_decode" do
      it "should decode a base64 string" do
        'dGo='.base64_decode.should == 'tj'
      end
    end
    
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
    
    describe "#starts_with?" do
      it "should check if a string starts with another" do
        'foo bar'.starts_with?('foo').should be_true
        ' foo bar'.starts_with?('foo').should_not be_true
        'bar foo'.starts_with?('foo').should_not be_true
      end
    end
    
    describe "#ends_with?" do
      it "should check if a string ends with another" do
        'foo bar'.ends_with?('bar').should be_true
        'foo bar '.ends_with?('bar').should_not be_true
        'bar foo foo'.ends_with?('foo').should be_true
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
      
      it "should return n number of charcters" do
        'foo'.first(2).should == 'fo'
      end
    end
  
    describe "#last" do
      it "should return the last character" do
        'bar'.last.should == 'r'
      end
      
      it "should return the last n number of characters" do
        'bar'.last(2).should == 'ar'
      end
    end
    
    describe "#from" do
      it "should return all characters from n" do
        'cookies'.from(3).should == 'kies'
      end
    end
    
    describe "#camelize" do
      it "should camel-case a string, leaving the first character lower by default" do
        'some_foo_bar'.camelize.should == 'someFooBar'
      end
      
      it "should camel-case a string, with first character capitalized" do
        'some_foo_bar'.camelize(true).should == 'SomeFooBar'
      end
    end
    
    describe "#constantize" do
      it "should convert a string to a constant" do
        'Rext::VERSION'.constantize.should == Rext::VERSION
      end
      
      it "should raise an error when an invalid constant name is passed" do
        lambda { 'foo bar'.constantize }.should raise_error(NameError)
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