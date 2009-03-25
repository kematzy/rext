
require 'rext/module/helpers'

class BasicObject
  instance_methods.each { |m| undef_method m unless m.match(/^__/) }
end

module RemoveBasicObjectMethods
  def method_added name
    BasicObject.send :undef_method, name if self == Object
    super
  end
end

Object.extend RemoveBasicObjectMethods
Kernel.extend RemoveBasicObjectMethods
