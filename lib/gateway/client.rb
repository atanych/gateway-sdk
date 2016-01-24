require 'json'
require 'yaml'
require 'uri'
require 'rest-client'
module Gateway

  class << self
    attr_accessor :config
  end

  #
  # Client
  #
  class Client

    METHOD_GET  = 'get' # http method GET
    METHOD_POST = 'post' # http method POST

    attr_accessor :request
    attr_reader :config_data, :test

    #
    # Initialize
    #
    # @param [Gateway::Requests::CommonRequest] request
    # @param [TrueClass|FalseClass] test test or production modes
    #
    def initialize(request, test = false)
      Gateway.config = JSON.parse(YAML.load_file("#{Gateway.root}/gateway/config.yml").to_json, object_class: OpenStruct)
      @request       = request
      @test          = test
      request_name = request.class.name.split('::').last
      @config_data   = Gateway.config.api_methods[request_name]
      raise Gateway::StandardError.new("fill data in config.yml for method: #{request_name}") unless @config_data
    end

    #
    # Send request to gateway and take response from it
    #
    # @return [Hash] raw response from gateway
    #
    def response
      # Rails.logger.debug('gateway request: ' + YAML::dump(request))
      query_params = {r: config_data.route}
      case config_data.http_method
        when METHOD_GET
          query_params.merge! request.attributes
          response = RestClient.get(url(query_params))
        when METHOD_POST
          response = RestClient.post(url(query_params), request.attributes)
        else
          raise Gateway::ArgumentError.new("http method #{config_data.http_method} is not supported")
      end
      return JSON.parse(response)
    rescue RestClient::Exception => e
      response = JSON.parse e.response
      raise Gateway::StandardError.new(response['message'])
    end


    #
    # Generate url
    #
    # @param [Hash] query_params
    #
    # @return [String] url with query params
    #
    def url(query_params)
      url = test ? Gateway.config.urls.test : Gateway.config.urls.production
      url += '?' + URI.encode_www_form(query_params) unless query_params.empty?
      url
    end
  end
end