# frozen_string_literal: true

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { Menu.new(dishes) }
  let(:dishes) { { taco: 4.45, drink: 2.95 } }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'Takeaway lists dishes from the menu' do
    expect(takeaway.show_menu).to eq 'Taco: $4.45, Drink: $2.95'
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it '' do
  end
end
