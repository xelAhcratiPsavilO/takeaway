# frozen_string_literal: true

class Takeaway
  def initialize(menu, order, sms)
    @menu = menu
    @order = order
    @sms = sms
  end

  def show_menu
    menu.list
  end

  def take_order(orders)
    orders.each { |dish, quantity| order.add(dish, quantity) }
  end

  def confirm_order
    order.total
  end

  def send_sms
    sms.send
  end

  private

  attr_reader :menu, :order, :sms
end
