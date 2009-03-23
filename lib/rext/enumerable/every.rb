
#--
# Copyright http://github.com/mynyml
#++

class Every
  instance_methods.each { |m| undef_method m unless m.match(/^__/) }
  
  def initialize enum
    @enum = enum
  end
  
  def method_missing meth, *args, &block
    @enum.map { |o| o.__send__(meth, *args, &block) }
  end
end
 
module Enumerable
  
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
    block ? Every.new(self).instance_eval(&block) : Every.new(self)
  end
  
end