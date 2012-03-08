module Decorator
  def decorate
    klass = "#{self.class.name}Decorator"
    klass.constantize.decorate(self)
  end
end

ActiveRecord::Base.send(:include, Decorator) if defined? ActiveRecord::Base

class Array
  def decorate
    map(&:decorate)
  end
end
