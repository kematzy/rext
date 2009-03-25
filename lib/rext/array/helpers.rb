
class Array
  
  ##
  # Return array of elements after +position+.

  def from position
    self[position..-1]
  end

  ##
  # Return array of elements up to +position+.
  
  def to position
    self[0..position]
  end
  
end