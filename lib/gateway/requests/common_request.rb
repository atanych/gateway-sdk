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
          hash[attr[1..-1]] = instance_variable_get attr
        end
        hash
      end

    end
  end
end