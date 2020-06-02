# frozen_string_literal: true

require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }
  let(:new_dish) { { dish: 1 } }

  describe '#add' do
    context 'when dish not in the menu' do
      before do
        allow(menu).to receive(:dish?).with(:not_our_dish).and_return(false)
      end
      it 'raises an error' do
        expect { order.add(:not_our_dish, 1) }.to raise_error 'Not in the menu'
      end
    end
    context 'when dish is in the menu' do
      before do
        allow(menu).to receive(:dish?).with(:dish).and_return(true)
      end
      it 'adds a dish to the order' do
        order.add(:dish, 1)
        expect(order.dishes).to include new_dish
      end
    end
  end

  describe '#dishes' do
    context 'when dishes have been ordered' do
      before do
        allow(menu).to receive(:dish?).with(:dish1).and_return(true)
        allow(menu).to receive(:dish?).with(:dish2).and_return(true)
        order.add(:dish1, 1)
        order.add(:dish2, 2)
      end
      it 'lists dishes in the order' do
        expect(order.dishes).to eq({ dish1: 1, dish2: 2 })
      end
    end
  end

  describe '#total' do
    context 'when dishes have been ordered' do
      before do
        allow(menu).to receive(:dish?).with(:dish1).and_return(true)
        allow(menu).to receive(:dish?).with(:dish2).and_return(true)
        allow(menu).to receive(:price).with(:dish1).and_return(4.45)
        allow(menu).to receive(:price).with(:dish2).and_return(2.95)
        order.add(:dish1, 1)
        order.add(:dish2, 2)
      end
      it 'confirms the total price of the order' do
        expect(order.total).to eq 10.35
      end
    end
  end
end
