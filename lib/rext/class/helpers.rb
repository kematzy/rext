
class Module
  
  ##
  # Shortcut for including an anonymous module.
  
  def chain &block
    include Module.new(&block)
  end
  
end