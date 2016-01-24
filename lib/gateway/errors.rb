module Gateway
  #
  # Standard error
  #
  class StandardError < StandardError
    attr_accessor :message

    #
    # Initialize
    #
    # @param [String] message
    #
    def initialize(message)
      @message = message
    end

  end

  #
  # Argument error
  #
  class ArgumentError < ArgumentError
    attr_accessor :message

    #
    # Initialize
    #
    # @param [String] message
    #
    def initialize(message)
      @message = message
    end

  end
end