
class Numeric
  
  def bytes;     self       end
  def kilobytes; self << 10 end
  def megabytes; self << 20 end
  def gigabytes; self << 30 end
  def terabytes; self << 40 end
  
  alias :byte :bytes
  alias :kilobyte :kilobytes
  alias :megabyte :megabytes
  alias :gigabyte :gigabytes
  alias :terabyte :terabytes
  
end