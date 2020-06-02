# frozen_string_literal: true

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(menu, order) }
  let(:menu) { Menu.new(dishes) }
  let(:dishes) { { taco: 4.45, drink: 2.95 } }
  let(:order) { Order.new(menu) }
  let(:orders) { { taco: 1, drink: 2 } }
  let(:invalid_order) { { turnip: 1 } }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'Takeaway lists dishes from the menu' do
    expect(takeaway.show_menu).to eq 'Taco: $4.45, Drink: $2.95'
  end
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'Takeaway adds dishes to the order' do
    allow(menu).to receive(:dish?).with(:taco).and_return(true)
    allow(menu).to receive(:dish?).with(:drink).and_return(true)
    takeaway.take_order(orders)
    expect(order.dishes).to include orders
  end
  it 'Takeaway raises an error if dish is not in the menu' do
    allow(menu).to receive(:dish?).with(:turnip).and_return(false)
    expect { takeaway.take_order(invalid_order) }.to raise_error 'Not in the menu'
  end
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'Takeaway confirms order total' do
    allow(menu).to receive(:dish?).with(:taco).and_return(true)
    allow(menu).to receive(:dish?).with(:drink).and_return(true)
    takeaway.take_order(orders)
    expect(takeaway.confirm_order).to eq 10.35
  end
end
