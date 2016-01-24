require 'spec_helper'

describe Gateway::Requests::SendMessageRequest do

  before(:each) do
    @request = Gateway::Requests::SendMessageRequest.new
  end

  describe '#transport=' do
    context 'when transport is wrong' do
      it 'raises ArgumentError' do

        expect { @request.transport = 'foo' }.to raise_error(Gateway::ArgumentError)
      end
    end

    context 'when transport is not wrong' do
      it 'does not raise any errors' do
        @request.transport = 'whatsapp'
      end
    end
  end

end
