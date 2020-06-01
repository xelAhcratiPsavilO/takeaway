# frozen_string_literal: true

class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def show_menu
    menu.list
  end

  private

  attr_reader :menu
end
