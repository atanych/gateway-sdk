module Gateway
  module Requests

    #
    # Common request
    # All request is needed to inheritance from it
    #
    class CommonRequest

      #
      # Convert instance variables to hash
      #
      # @return [Hash]
      #
      def attributes
        hash = {}
        instance_variables.each do |attr|
          value = instance_variable_get attr
          if value.is_a? Gateway::Requests::CommonRequest
            hash[attr[1..-1]] = value.attributes
          else
            hash[attr[1..-1]] = value
          end
        end
        hash
      end
    end
  end
end