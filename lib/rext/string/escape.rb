
require 'rack'

class String
  
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
  # === Examples:
  #
  #   'im <strong>strong</strong>.escape_html  # => im &lt;strong&gt;strong&lt;/strong&gt;
  #

  def escape_html
    Rack::Utils.escape_html self
  end
  
end