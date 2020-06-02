# frozen_string_literal: true

class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def list
    dishes.map { |name, price| format('%s: $%s', name.capitalize, price) }.join(', ')
  end

  def dish?(dish)
    dishes.include? dish
  end

  def price(dish_name)
    dishes[dish_name]
  end
end
