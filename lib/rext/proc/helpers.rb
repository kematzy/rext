
class Proc
  
  ##
  # Yield or instance evaluate the +object+ passed
  # based on this proc's arity.
  #
  # === Examples
  #
  #   def foo &block
  #     block.yield_or_eval 'bar'
  #   end
  #
  #   foo { |v| v.length }  # => 3
  #   foo { length }        # => 3
  #
  
  def yield_or_eval object
    arity > 0 ? self.call(object) : object.instance_eval(&self)
  end
  
end