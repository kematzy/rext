
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
  # Pad array with expected length +n+, and +pad_with+ an
  # optional object or nil.
  #
  # === Examples
  #
  #   [1,2].pad(4)  # => [1,2,nil,nil]
  #   [1,2].pad(4)  # => [1,2,'x','x']
  #   [1,2].pad(2)  # => [1,2]
  #
  
  def pad n, pad_with = nil
    fill pad_with, length, n - length
  end
  
  ##
  # Split an array into chunks of length +n+. When a +block+
  # is present each chunk will be passed to it.
  
  def chunk n, pad_with = nil, &block
    (0..length / n).inject [] do |chunks, i|
      chunk = slice(i * n, n).pad n, pad_with
      yield chunk if block
      chunks << chunk
    end
  end
  alias :in_groups_of :chunk
  
end