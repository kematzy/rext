
class Object
  
  ##
  # Returns a hash indifferent to symbols or strings for 
  # accessor keys.
  #
  # === Examples
  #
  #   hash = indifferent_hash
  #   hash['foo'] = 'bar'
  #
  #   hash[:foo]  #=> 'bar'
  #   hash['foo'] #=> 'bar'
  #
  
  def indifferent_hash
    Hash.new { |hash, key| hash[key.to_s] if key.is_a? Symbol }
  end
  
end