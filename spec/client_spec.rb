require 'spec_helper'

describe Gateway::Client do
  ACCESS_TOKEN = 'test_token'
  describe '#initialize' do
    context 'when there are not data in config.yml for api method' do
      it 'raises StandardError' do
        expect { Gateway::Client.new(Gateway::Requests::CommonRequest.new, ACCESS_TOKEN, true) }.to raise_error(Gateway::StandardError)
      end
    end
  end
  describe '#response' do
    describe 'api methods' do

      describe 'send_message' do
        it 'sends request and receives response' do
          request             = Gateway::Requests::SendMessageRequest.new
          request.phone       = '375447697415'
          request.devicePhone = '972502619555'
          request.transport   = Gateway::Requests::SendMessageRequest::TRANSPORT_WA
          request.body        = 'something!'
          client              = Gateway::Client.new(request, ACCESS_TOKEN, true)
          expect(client.response['status']).to eq('OK')
        end
      end
      describe 'set_profile' do
        it 'sends request and receives response' do
          request             = Gateway::Requests::SetProfileRequest.new
          request.type        = 1
          request.devicePhone = '792176396031'
          request.value       = 'new nickname'
          client              = Gateway::Client.new(request, ACCESS_TOKEN, false)
          expect(client.response['status']).to eq('error')
        end
      end
    end
  end

  describe '#url' do
    context 'when api mode is test' do
      it 'returns test gateway url' do
        config = JSON.parse(YAML.load_file("#{Gateway.root}/gateway/config.yml").to_json, object_class: OpenStruct)
        client = Gateway::Client.new(Gateway::Requests::SendMessageRequest.new, ACCESS_TOKEN, true)
        expect(client.url({})).to eq(config.urls.test)
      end
    end
    context 'when api mode is production' do
      it 'returns production gateway url' do
        config = JSON.parse(YAML.load_file("#{Gateway.root}/gateway/config.yml").to_json, object_class: OpenStruct)
        client = Gateway::Client.new(Gateway::Requests::SendMessageRequest.new, ACCESS_TOKEN, false)
        expect(client.url({})).to eq(config.urls.production)
      end
    end
  end

end
