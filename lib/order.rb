# frozen_string_literal: true

class Order
  attr_accessor :dishes

  def initialize(menu)
    @menu = menu
    @dishes = {}
  end

  def add(dish, quantity)
    raise 'Not in the menu' unless menu.dish?(dish)

    add_to_dishes(dish, quantity)
  end

  def total
    total_by_dish.inject(:+).truncate(2)
  end

  private

  attr_reader :menu

  def total_by_dish
    dishes.map { |dish, quantity| menu.price(dish) * quantity }
  end

  def add_to_dishes(dish, quantity)
    dishes[dish] = quantity
  end
end
