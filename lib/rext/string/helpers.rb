
require 'extlib'

class String
  
  def base64_decode
    unpack('m').first
  end
  
  def base64_encode
    [self].pack('m').chop
  end
  
  ##
  # Returns a File instance.
  #
  # === Examples
  #
  #   'History.rdoc'.file.mtime
  #
  
  def file
    File.new self
  end
  
  ##
  # Returns a Pathname instance.
  #
  # === Examples
  #
  #   'lib'.path.join('foo').expand_path
  #
  
  def path
    require 'pathname'
    Pathname.new self
  end
  
  ##
  # Returns an array of files matching self.
  #
  # === Examples
  #
  #  'lib/**/*.rb'.files
  #
  
  def files
    Dir[self]
  end
  
  ##
  # Merge the +word+ passed into the string. This
  # is useful for adding classes which may already 
  # exist in a string.
  #
  # === Examples 
  #
  #   'product'.merge_word('sold')        # => "product sold"
  #   'product sold'.merge_word('sold')   # => "product sold"
  #
  
  def merge_word word
    self << " #{word}" unless split.include? word
    self
  end
  alias :add_class :merge_word
  
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
  # Returns a constant when the string is a valid constant name.
  
  def constantize
    Extlib::Inflection.constantize self
  end
  
  ##
  # Convert a string to camel-case, and optionally +capitalize_first_letter+.
  
  def camelize capitalize_first_letter = false
    string = Extlib::Inflection.camelize(self)
    return string if capitalize_first_letter
    string[0,1] = string.first.downcase
    string
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
    index(string) == 0
  end
  
  ##
  # Check if a string ends with another +string+.
  #
  # === Examples
  #
  #   'foo bar'.end_with? 'bar'  # => true
  #

  def end_with? string
    rindex(string) == length - string.length
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
