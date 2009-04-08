
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
  
  ##
  # Return an array of switches and their arguments.
  #
  # === Examples
  #
  #   { :use_foobar => true }.switchify   # => ['--use-foobar']
  #   { :use_foobar => false }.switchify  # => []
  #   { :interval => 15, :icon => :jpeg } # => ['--interval', '15', '--icon', 'jpeg']
  #
  
  def switchify
    inject [] do |args, (key, value)|
      next args unless value
      args << key.to_s.switchify
      args << (String === value ? value.inspect : value.to_s) unless value === true
      args
    end
  end
  
end