require "#{File.dirname(__FILE__)}/gateway/requests/common_request"
Dir["#{File.dirname(__FILE__)}/gateway/**/*.rb"].each {|file| require file }

#
# SDK for gateway (sending messages and setting params)
#
module Gateway

  #
  # Return root path
  #
  # @return [String]
  #
  def self.root
    File.dirname __FILE__
  end
end
