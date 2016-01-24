require File.expand_path('../common_request', __FILE__)
module Gateway
  module Requests
    #
    # Request to change settings for whatsapp account via gateway
    #
    class SetProfileRequest < CommonRequest

      TYPE_NICKNAME = 1 # nickname
      TYPE_AVATAR   = 2 # path to avatar
      TYPE_STATUS   = 3 # status

      attr_accessor :type, :devicePhone, :value

      #
      # Possible types
      #
      def self.possible_types
        [TYPE_NICKNAME, TYPE_AVATAR, TYPE_STATUS]
      end

      def type=(type)
        unless self.class.possible_types.include? type
          raise Gateway::ArgumentError.new("type #{type} is not supported, use: #{self.class.possible_types.join(', ')}")
        end
        @type = type
      end

    end
  end

end