
require 'rext/proc/helpers'

module Enumerable
  
  ##
  # Return a hash grouped by +block+.
  #
  # === Examples
  #
  #   words = %w( just some foo bar )
  #   words.group_by { |word| word.length }  # => {3=>["foo", "bar"], 4=>["just", "some"]}
  #   words.group_by { length }              # => {3=>["foo", "bar"], 4=>["just", "some"]}
  #
  
  def group_by &block
    inject({}) do |hash, value|
      (hash[block.yield_or_eval(value)] ||= []) << value
      hash
    end
  end
  
end
