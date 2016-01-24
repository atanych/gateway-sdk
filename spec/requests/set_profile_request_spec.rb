require 'spec_helper'

describe Gateway::Requests::SetProfileRequest do

  before(:each) do
    @request = Gateway::Requests::SetProfileRequest.new
  end

  describe '#type=' do
    context 'when type is wrong' do
      it 'raises ArgumentError' do
        expect { @request.type = 'foo' }.to raise_error(Gateway::ArgumentError)
      end
    end

    context 'when type is not wrong' do
      it 'does not raise any errors' do
        @request.type  = 1
      end
    end
  end

end
