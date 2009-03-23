
require 'rext/class/helpers'
require 'rext/proc/helpers'

module Enumerable
  
  ##
  # Proxy
  #
  # The enumerable proxy class is utilized to
  # allow methods such as #group_by, #map, and others
  # to provide a method call alternative to a block.
  #
  # For example words.group_by { |word| word.length } can
  # be replaced by words.group_by_.length
  #
  # === See
  #
  # * Enumerable#proxy
  #
  
  class Proxy
    instance_methods.each { |m| undef_method m unless m.match(/^__/) }
    
    def initialize object, meth
      @object, @method = object, meth
    end

    def method_missing meth, *args, &block
      @object.__send__(@method) { |o| o.__send__(meth, *args, &block) }
    end
  end
  
  ##
  # Shortcut for Proxy.new self, +meth+.
  
  def proxy meth
    Proxy.new self, meth
  end
    
  ##
  # Return a hash grouped by +block+.
  #
  # === Examples
  #
  #   words = %w( just some foo bar )
  #   words.group_by { |word| word.length }  # => {3=>["foo", "bar"], 4=>["just", "some"]}
  #   words.group_by { length }              # => {3=>["foo", "bar"], 4=>["just", "some"]}
  #   words.group_by.length                  # => {3=>["foo", "bar"], 4=>["just", "some"]}
  #

  def group_by &block
    return proxy(:group_by) unless block
    inject({}) do |hash, value|
      (hash[block.yield_or_eval(value)] ||= []) << value
      hash
    end
  end
  
  ##
  # Sexy Symbol#to_proc replacement for mapping enums.
  #
  # === Examples
  #    
  #   names = %w( tj scott joe bob )
  #   names.every.length.join          # => 2533
  #   names.every.empty?.any?          # => false
  #   names.every { length > 4 }.all?  # => true
  #
  
  def every &block
    block ? proxy(:map).instance_eval(&block) : proxy(:map)
  end
  
end
