# frozen_string_literal: true

class Menu
  attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def list
    dishes.map do |name, price|
      format('%s: $%s', name.capitalize, price)
    end.join(', ')
  end
end
