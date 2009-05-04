
require 'rext/module'

describe Module do
  describe "helpers" do
    describe "#proxy_method" do
      it "should implement method_missing, passing regexp captures and arguments to the handler method" do
        class FooBar
          call_method :find, :if => /^find_by_(\w+)_(\w+)/
          call_method :delete, :if => lambda { |meth, *args| meth.to_s =~ /^delete_by_(\w+)_(\w+)/ }
          def find *args; args end
          def delete *args; args; end
        end
        foo = FooBar.new
        foo.find_by_user_email.should == ['user', 'email']
        foo.find_by_user_name('foo').should == ['user', 'name', 'foo']
        foo.delete_by_user_name('foo', 'bar').should == ['foo', 'bar']
        lambda { foo.does_not_exist }.should raise_error(NoMethodError)
      end
    end
  end
end