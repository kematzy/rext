
class Module
  
  ##
  # Shortcut for including an anonymous module.
  
  def chain &block
    include Module.new(&block)
  end
  
  ##
  # Call +method+ when conditions are met.
  #
  # This method provides a simple means of 
  # utilizing method_missing, and should
  # be used in most cases.
  #
  # When using a regular expression with
  # the :if option, all captures are passed
  # to the handling method.
  #
  # === Examples
  #    
  #   class Foo
  #     call_method :find_by, :if => /^find_by_(\w+)/
  #     def find_by attr, *args
  #       "finding by #{attr} with #{args.join(', ')}"
  #     end
  #   end
  #
  #   foo = Foo.new
  #   foo.find_by_name('bar') # => "finding by name with bar"
  #
  # === Options
  #
  #   :if   regexp or proc
  #
  
  def call_method method, options = {}
    chain {
      define_method :method_missing do |meth, *args|
        if options[:if].is_a?(Regexp) && meth.to_s =~ options[:if]
          send method, *($~.captures + args)
        elsif options[:if].respond_to?(:call) && options[:if].call(meth, *args)
          send method, *args
        else
          super
        end
      end
    }
  end
  
end