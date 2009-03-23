
require 'rext/hash'

describe Hash do
  
  describe "#delete_at" do
    it "should delete several keys, returning their values when present" do
      options = { :foo => 1, :bar => 2 }
      foo, bar, does_not_exist = options.delete_at :foo, :bar, :does_not_exist
      foo.should == 1
      bar.should == 2
      does_not_exist.should be_nil
    end
  end
  
end