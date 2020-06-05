#! /usr/bin/env ruby
# frozen_string_literal: true

require 'dotenv'
require './lib/takeaway'
require './lib/menu'
require './lib/order'
require './lib/sms'
require 'twilio-ruby'

Dotenv.load

menu_list = {
  'taco' => 3.35,
  'burrito' => 5.50,
  'enchiladas' => 4.45,
  'quesadillas' => 2.50,
  'guacamole' => 1.50,
  'salsa' => 1.50,
  'drink' => 2.95
}

welcome
phone = gets.chomp

config =
  {
    account_sid: ENV['ACCOUNT_SID'],
    auth_token: ENV['AUTH_TOKEN'],
    from: ENV['PHONE'],
    to: phone,
    body: 'Thank you! Your order will be delivered before %s'
  }

client = Twilio::REST::Client.new(config[:account_sid], config[:auth_token])
menu = Menu.new(menu_list)
order = Order.new(menu)
sms_class = Sms
takeaway = Takeaway.new(menu, order, sms_class, config, client)


puts 'Menu:'
p takeaway.show_menu
loop do
  puts 'What would you like to order? type \'done\' when you have finished.'
  dish = gets.strip.downcase
  break if dish == 'done'
  puts "How many #{dish} would you like to orderd?"
  quantity = gets.to_i
  order.add(dish, quantity)
end

takeaway.take_order(order.dishes)
print 'Your total will be: $'
p takeaway.confirm_order
puts 'You will receive an sms confirming the delivery time soon.'
puts 'Enjoy your food!'
takeaway.send_sms

BEGIN {
  def welcome
    puts 'Welcome to our takeaway!'
    puts 'Please type your phone number to receive confirmation of delivery time.'
    puts 'Format example: +447123456789'
  end
}
