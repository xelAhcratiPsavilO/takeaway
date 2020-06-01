# frozen_string_literal: true

require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }
  let(:dishes) { { taco: 4.45, drink: 2.95 } }
  describe '#dishes' do
    it 'has a list of dishes' do
      expect(menu.dishes).to eq dishes
    end
  end
  describe '#list' do
    it 'lists dishes and prices' do
      expect(menu.list).to eq 'Taco: $4.45, Drink: $2.95'
    end
  end
end
