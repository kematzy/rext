
require 'extlib'
require 'digest/sha2'
require 'digest/md5'

class String
  
  ##
  # Return 32 character md5 string.
  #
  # === Examples
  #
  #  'test'.to_md5  # => 098f6bcd4621d373cade4e832627b4f6
  #
  
  def to_md5
    Digest::MD5.hexdigest self
  end
  
  ##
  # Return 128 character sha512 string.
  #
  # === Examples
  #
  #  'test'.to_sha512  # => ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff
  #
  
  def to_sha512
    Digest::SHA512.hexdigest self
  end
  
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
  
  ##
  # Replace all underscores with hyphens.

  def dasherize
    tr '_', '-'
  end
  
  ##
  # Return hash of word frequencies.
  #
  # === Examples
  #
  #   'foo foo bar'.word_frequency 
  #   # => { 'foo' => 2, 'bar' => 1 }
  #
  
  def word_frequency
    split.inject Hash.new(0) do |frequencies, word|
      frequencies[word] += 1
      frequencies
    end
  end
  
  ##
  # Return frequency of _word_ or 0.
  #
  # === Examples
  #
  #   'foo foo bar'.frequency_of_word('foo') # => 2
  #   'foo foo bar'.frequency_of_word('bar') # => 1
  #
  
  def frequency_of_word word
    word_frequency[word]
  end
  
  class InvalidSwitchError < StandardError; end
  
  ##
  # Returns the switch equivilant of this string.
  #
  # === Examples
  #
  #  'foo_bar'.switchify         # => --foo-bar
  #  'lots_of_foobar'.switchify  # => --lots-of-foobar
  #  't'.switchify               # => -t
  #  ''.switchify                # => InvalidSwitchError
  #
  
  def switchify
    raise InvalidSwitchError, 'switch must have a length > 0' if length.zero?
    length > 1 ? "--#{dasherize}" : "-#{self}"
  end
    
end
