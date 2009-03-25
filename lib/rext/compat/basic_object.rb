
require 'rext/module/helpers'

class BasicObject
  def self.hide name
    undef_method name
  end
  instance_methods.each { |m| hide(m) unless m.match(/^__/) }
end

module RemoveBasicObjectMethods
  def method_added name
    BasicObject.hide name if self == Object
    super
  end
end

Object.extend RemoveBasicObjectMethods
Kernel.extend RemoveBasicObjectMethods
