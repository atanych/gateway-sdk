require File.expand_path('../common_request', __FILE__)
module Gateway
  module Requests
    class InboxMessageRequest < Gateway::Requests::CommonRequest
      attr_accessor :device_key, :body, :image, :location, :client, :video
    end
  end
end