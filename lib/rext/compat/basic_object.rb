
require 'rext/module/helpers'

class BasicObject
  instance_methods.each { |m| undef_method m unless m.match(/^__/) }
end