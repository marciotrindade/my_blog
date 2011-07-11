module RoutesMacros
  module ClassMethods

    def respond_to_route(path, route)
      key = path.keys.first.to_s.pluralize
      value = path.values.first.split('/').join(' ').strip || "/"
      it "route to #{key} #{value}" do
        path.should route_to(route)
      end
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
  end
end
