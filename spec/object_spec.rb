
require File.dirname(__FILE__) + '/spec_helper'
require 'rext/object'

describe Object do
  describe "metaclass" do
    describe "#metaclass" do
      it "should return the anonymous 'virtual' class" do
        'foo'.metaclass.should be_an_instance_of(Class)
      end
    end
    
    describe "#meta_eval" do
      it "should evaluate a block in context to the metaclass" do
        object = 'foo'
        object.meta_eval do
          define_method :foo do
            'bar'
          end
        end
        object.foo.should == 'bar'
      end
      
      it "should accept a string to be evaluated" do
        object = 'foo'
        object.meta_eval <<-EOF
          def foo
            'bar'
          end
        EOF
        object.foo.should == 'bar'
      end
    end
    
    describe "#meta_def" do
      it "should define a method within the metaclass" do
        object = 'foo'
        object.meta_def(:foo) { |*args| "bar #{ args.join(', ') }" }
        object.foo(1,2,3).should == 'bar 1, 2, 3'
      end
    end
  end
  
  describe "helpers" do
    describe "#indifferent_hash" do
      it "should return a hash indifferent to symbols or strings for key access" do
        hash = indifferent_hash
        hash['foo'] = 'foo'
        hash[:foo].should == 'foo'
        hash['foo'].should == 'foo'
      end
    end
  end
  
  describe "#try" do
    it "should try the block once with no args" do
      times = 0
      try { times += 1 }
      times.should == 1
    end
    
    it "should try the block multiple times when failing" do
      times = 0
      try(3) { times += 1; raise 'foo' }
      times.should == 3
    end
    
    it "should try the block one time when succesful" do
      times = 0
      try(3) { times += 1 }
      times.should == 1
    end
    
    it "should return the value returned by the block" do
      val = try(3) { 'test' }
      val.should == 'test'
    end
    
    it "should allow specific exceptions to be rescued" do
      lambda { try(3){ raise ArgumentError, 'foo' } }.should_not raise_error
      lambda { try(3, :on => ArgumentError){ raise ArgumentError, 'foo' } }.should_not raise_error
      lambda { try(3, :on => TypeError){ raise ArgumentError, 'foo' } }.should raise_error(ArgumentError)
    end
  end
  
  describe "#returning" do
    it "should return the value given to it" do
      def frequency_of enum
        returning Hash.new(0) do |hash|
          enum.each do |value|
            hash[value] += 1
          end
        end
      end
      frequency_of(%w( foo bar foo foo )).should == {
        'foo' => 3,
        'bar' => 1,
      }
    end
  end
end