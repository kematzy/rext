
class Hash
  
  ##
  # Delete key-value pairs, returning the values found
  # using the +keys+ passed. Aliased as extract!
  #
  # === Examples
  #
  #   options = { :width => 25, :height => 100 }
  #   width, height = options.delete_at :width, :height  
  #
  #   width   # => 25
  #   height  # => 100
  #   options # => {}
  #
  
  def delete_at *keys
    keys.map { |key| delete key }
  end
  alias :extract! :delete_at
  
end