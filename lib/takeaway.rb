# frozen_string_literal: true

class Takeaway
  def initialize(menu, order)
    @menu = menu
    @order = order
  end

  def show_menu
    menu.list
  end

  def take_order(orders)
    orders.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  def confirm_order
    order.total
  end

  private

  attr_reader :menu, :order
end
