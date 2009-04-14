
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
  
  ##
  # Split an array into +n+ chunks. When a +block+
  # is present each chunk will be passed to it.
  
  def chunk n, fill_with = nil, &block
    (0..n-1).inject [] do |chunks, i|
      chunk = slice i * n, n
      yield chunk if block
      chunks << chunk
    end
  end
  alias :in_groups_of :chunk
  
end