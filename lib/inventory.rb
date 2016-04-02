require 'json'

module CoffeeStore
  class CoffeeInventory

    MENU_FILE = File.read(File.dirname(__FILE__) + '/menu.json');
    SECONDS_NEEDED_TO_MAKE_COFFEE = 60

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
      order_details["time_of_order"] = Time.new
      @orders[@order_counter] = order_details
      begin
        @order_counter
      ensure
        @order_counter += 1
      end
    end

    def orders
      @orders
    end

    def order_status(order_id)
      if elapsed_time(order_id) >= SECONDS_NEEDED_TO_MAKE_COFFEE
        "READY"
      else
        "WAITING"
      end
    end

    def elapsed_time(order_id)
      Time.now - @orders[order_id]["time_of_order"]
    end
  end
end
