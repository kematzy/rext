
require 'rack'
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
    ::Digest::MD5.hexdigest self
  end
  
  ##
  # Return 128 character sha512 string.
  #
  # === Examples
  #
  #  'test'.to_sha512  # => ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff
  #
  
  def to_sha512
    ::Digest::SHA512.hexdigest self
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
  # URL encode. Shortcut for Rack::Utils.encode.

  def url_encode
    Rack::Utils.escape self
  end

  ##
  # URL decode. Shortcut for Rack::Utils.unescape.

  def url_decode
    Rack::Utils.unescape self
  end

  ##
  # Escape html entities. Shortcut for Rack::Utils.escape_html.
  #
  # === Examples
  #
  #   'im <strong>strong</strong>.escape_html  # => im &lt;strong&gt;strong&lt;/strong&gt;
  #

  def escape_html
    Rack::Utils.escape_html self
  end
  
end