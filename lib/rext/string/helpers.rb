
require 'extlib'

class String
  
  ##
  # Digitize a string.
  #
  # === Examples:
  #
  #  '$100,000'.digitize  # => 100000
  #
  
  def digitize
    gsub /[^\d]/, ''
  end
  
  ##
  # Wrap a string with a +prefix+ and optional
  # +suffix+. When the +suffix+ is not present
  # the +prefix+ will be used.
  #
  # === Examples
  #
  #   'foo'.wrap('|')       # => |foo|
  #   'foo'.wrap('(', ')')  # => (foo)
  #
  
  def wrap prefix, suffix = nil
    prefix + self + (suffix || prefix)
  end
  
  ##
  # Check if a string starts with another +string+.
  #
  # === Examples
  #
  #   'foo bar'.start_with? 'foo'  # => true
  #

  def start_with? string
    !!match(/^#{string}/)
  end

  ##
  # Determines if a string is plural.
  #
  # === Examples
  #
  #   'cookies'.plural?  # => true
  #   'cookie'.plural?   # => false
  #

  def plural?
    singular != self
  end

  ##
  # Determines if a string is singular.
  #
  # === Examples
  #
  #   'cookies'.singular?  # => false
  #   'cookie'.singular?   # => true
  #

  def singular?
    !plural?
  end

  ##
  # First character.

  def first 
    self[0,1]
  end

  ##
  # Last character.

  def last
    self[-1, 1]
  end
  
end