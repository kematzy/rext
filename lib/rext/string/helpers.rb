
require 'extlib'

class String
  
  ##
  # Return Base 64 decoded string.
  #
  # === Examples
  #
  #  'Y29va2llcw=='.base64_decode  # => cookies
  #
    
  def base64_decode
    unpack('m').first
  end
  
  ##
  # Return Base 64 encoded string.
  #
  # === Examples
  #
  #  'cookies'.base64_encode  # => Y29va2llcw==
  #
  
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
  #   'foo bar'.starts_with? 'foo'  # => true
  #

  def starts_with? string
    index(string) == 0
  end
  
  ##
  # Check if a string ends with another +string+.
  #
  # === Examples
  #
  #   'foo bar'.ends_with? 'bar'  # => true
  #

  def ends_with? string
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
    not plural?
  end

  ##
  # First +n+ character(s).
  #
  # === Examples
  #
  #   'foo'.first     # => f
  #   'foo'.first(2)  # => fo
  #

  def first n = 1
    self[0,n]
  end

  ##
  # Last +n+ character(s).
  #
  # === Examples
  #
  #   'bar'.last     # => r
  #   'bar'.last(2)  # => ar
  #
  
  def last n = 1
    self[-n, n]
  end
  
  ##
  # All characters after +n+.
  #
  # === Examples
  #
  #   '.css'.from(1)  #=> css
  #
  
  def from n
    self[n, length]
  end
  
end
