
class Numeric
  
  def bytes
    self
  end
  alias :byte :bytes

  def kilobytes
    self * 1024
  end
  alias :kilobyte :kilobytes

  def megabytes
    self * 1024.kilobytes
  end
  alias :megabyte :megabytes

  def gigabytes
    self * 1024.megabytes 
  end
  alias :gigabyte :gigabytes

  def terabytes
    self * 1024.gigabytes
  end
  alias :terabyte :terabytes
  
end