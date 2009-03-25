
require 'rext/module/helpers'

class BasicObject
  def self.hide name
    undef_method name
  end
  instance_methods.each { |m| hide(m) unless m.match(/^__/) }
end

class Object
  extend Module.new {
    def method_added name
      BasicObject.hide name if self == Object
      super
    end
  }
end