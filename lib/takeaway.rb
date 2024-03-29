# frozen_string_literal: true

class Takeaway
  def initialize(menu, order, sms_class, config, client)
    @menu = menu
    @order = order
    @sms = sms_class
    @config = config
    @client = client
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
    sms.new(config, client).send_msg
  end

  private

  attr_reader :menu, :order, :sms, :config, :client
end
