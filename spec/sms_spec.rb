# frozen_string_literal: true

require 'sms'

describe Sms do
  subject(:sms) { described_class.new(config, client) }
  let(:client) { double :client, messages: messages }
  let(:messages) { spy :messages }
  let(:config) do
    {
      account_sid: '123456789',
      auth_token: 'asdf1234',
      from: '777777',
      to: '767676',
      body: 'Thank you for your order! Your deliver will arrive before %s'
    }
  end

  describe '#send_msg' do
    context 'when it is 17:52' do
      before do
        allow(Time).to receive(:now).and_return(Time.parse('17:52'))
      end
      it 'sends an sms with the delivery time' do
        args = {
          from: config[:from],
          to: config[:to],
          body: 'Thank you for your order! Your deliver will arrive before 18:52'
        }
        sms.send_msg
        expect(messages).to have_received(:create).with(args)
      end
    end
  end
end
