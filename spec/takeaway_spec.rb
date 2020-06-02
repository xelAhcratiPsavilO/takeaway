# frozen_string_literal: true

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu }
  let(:order) { double :order }
  let(:orders) { { dish1: 1, dish2: 2 } }

  describe '#show_menu' do
    it 'instructs menu to show list' do
      expect(menu).to receive :list
      takeaway.show_menu
    end
  end
  describe '#take_order' do
    it 'instructs order to add dishes' do
      expect(order).to receive(:add).twice
      takeaway.take_order(orders)
    end
  end
end
