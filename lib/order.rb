# frozen_string_literal: true

class Order
  attr_accessor :dishes

  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(dish, quantity)
    raise 'Not in the menu' unless menu.dish?(dish)

    dishes[dish] = quantity
  end

  private

  attr_reader :menu
end
