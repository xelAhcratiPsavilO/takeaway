# frozen_string_literal: true

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order, sms, config) }
  let(:menu) { spy :menu }
  let(:order) { spy :order }
  let(:orders) { { dish1: 1, dish2: 2 } }
  let(:sms) { spy :sms, config }
  let(:config) { {} }

  describe '#show_menu' do
    it 'instructs menu to show list' do
      takeaway.show_menu
      expect(menu).to have_received :list
    end
  end
  describe '#take_order' do
    it 'instructs order to add dishes' do
      takeaway.take_order(orders)
      expect(order).to have_received(:add).twice
    end
  end
  describe '#confirm_order' do
    it 'instructs order to show the total' do
      takeaway.confirm_order
      expect(order).to have_received :total
    end
  end
  describe '#send_sms' do
    it 'instructs sms to be sent' do
      takeaway.send_sms
      expect(sms).to have_received :send_msg
    end
  end
end
