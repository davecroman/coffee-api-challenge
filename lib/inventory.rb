require 'json'

module CoffeeStore
  class CoffeeInventory

    MENU_FILE = File.read(File.dirname(__FILE__) + '/menu.json');

    def initialize()
      @menu_items = JSON.parse(MENU_FILE)
      @orders = {}
      @order_counter = 1
    end

    def menu_items
      @menu_items
    end

    def add_order(order_details, coffee_name)
      order_details["coffee_name"] = coffee_name
      @orders[@order_counter] = order_details
      begin
      	@order_counter
      ensure
      	@order_counter += 1
      end
    end

  end
end
