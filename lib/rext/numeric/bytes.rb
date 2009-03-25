
class Numeric
  
  def bytes; self end
  def kilobytes; self * 1024 end
  def megabytes; self * 1024.kilobytes end
  def gigabytes; self * 1024.megabytes end
  def terabytes; self * 1024.gigabytes end
  
  alias :byte :bytes
  alias :kilobyte :kilobytes
  alias :megabyte :megabytes
  alias :gigabyte :gigabytes
  alias :terabyte :terabytes
  
end