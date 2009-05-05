
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
  
  ##
  # Yeild and return +value+.
  #
  # === Examples
  #
  #   people = []
  #   people << 'tj'
  #   people << 'foo'
  #
  #   returning [] do |people|
  #     people << 'tj'
  #     people << 'foo'
  #   end
  #
  
  def returning value, &block
    yield value
    value
  end
  
end