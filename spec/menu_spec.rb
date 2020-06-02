# frozen_string_literal: true

require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { { dish1: 4.45, dish2: 2.95 } }

  describe '#dishes' do
    it 'has a list of dishes' do
      expect(menu.dishes).to eq dishes
    end
  end

  describe '#list' do
    it 'lists dishes and prices' do
      expect(menu.list).to eq 'Dish1: $4.45, Dish2: $2.95'
    end
  end

  describe '#dish?' do
    it 'is true if a dish is in the menu' do
      expect(menu.dish?(:dish1)).to be true
    end
    it 'is false if a dish is not in the menu' do
      expect(menu.dish?(:dish3)).to be false
    end
  end
end
