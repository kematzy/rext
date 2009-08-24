
class Symbol
  
  ##
  # Return a proc which sends itself as a message
  # to the first proc argument.
  #
  # === Examples
  #
  #  %w( some foo bar ).map(&:length)  # => [4, 3, 3]
  #
  
  def to_proc
    Proc.new { |object| object.send self }
  end
end