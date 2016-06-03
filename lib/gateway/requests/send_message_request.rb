require File.expand_path('../common_request', __FILE__)
module Gateway
  module Requests
    #
    # Request to send message via gateway
    #
    class SendMessageRequest < Gateway::Requests::CommonRequest

      TRANSPORT_WA    = 'whatsapp' # transport whatsapp
      TRANSPORT_VIBER = 'viber' # transport viber
      TRANSPORT_TG    = 'telegram' # transport telegram
      TRANSPORT_SMS   = 'modem' # transport modem
      TRANSPORT_FACEBOOK   = 'facebook' # transport facebook

      attr_accessor :phone, :devicePhone, :body, :image, :transport

      #
      # Possible transports
      #
      def self.possible_transports
        [TRANSPORT_WA, TRANSPORT_VIBER, TRANSPORT_TG, TRANSPORT_SMS, TRANSPORT_FACEBOOK]
      end

      def transport=(transport)
        unless self.class.possible_transports.include? transport
          raise Gateway::ArgumentError.new("transport #{transport} is not supported, use: #{self.class.possible_transports.join(', ')}")
        end
        @transport = transport
      end

    end
  end

end