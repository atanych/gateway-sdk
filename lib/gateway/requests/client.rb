module Gateway
  module Requests
    class Client < CommonRequest
      attr_accessor :key, :avatar, :nickname

      def initialize(attributes)
        attributes.each do |name, value|
          send("#{name}=", value) if respond_to? "#{name}="
        end
      end
    end
  end
end