
class Proc
  
  def yield_or_eval object
    arity > 0 ? self.call(object) : object.instance_eval(&self)
  end
  
end