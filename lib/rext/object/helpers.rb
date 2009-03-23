
class Object
  def chain &block
    include Module.new(&block)
  end
end