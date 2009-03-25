
class Object
  
  def metaclass
    class << self; self end
  end
  
  def meta_eval string = nil, &block
    return metaclass.class_eval(string) if string
    metaclass.class_eval &block
  end
  
  def meta_def name, &block
    meta_eval { define_method name, &block }
  end

end
