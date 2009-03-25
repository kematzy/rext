
class Object
  
  ##
  # Return the metaclass of this object.
  
  def metaclass
    class << self; self end
  end
  
  ##
  # Evaluate a +string+ or +block+ in context to this
  # object metaclass.
  
  def meta_eval string = nil, &block
    return metaclass.class_eval(string) if string
    metaclass.class_eval &block
  end
  
  ##
  # Define a singleton method.
  
  def meta_def name, &block
    meta_eval { define_method name, &block }
  end

end
