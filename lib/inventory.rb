require 'json'

module CoffeeStore
  class CoffeeInventory

    MENU_FILE = File.read(File.dirname(__FILE__) + '/menu.json');
    SECONDS_NEEDED_TO_MAKE_COFFEE = 60
    STATUS_NO_SUCH_ORDER = "NO_SUCH_ORDER"
    STATUS_READY = "READY"
    STATUS_MAKING = "MAKING"

    def initialize()
      @menu_items = JSON.parse(MENU_FILE)
      @orders = {}
      @order_counter = 1
    end

    def menu_items
      @menu_items
    end

    def orders
      @orders
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

    def order_status(order_id)
      if !@orders.key?(order_id)
        return STATUS_NO_SUCH_ORDER
      end

      if elapsed_time(order_id) >= SECONDS_NEEDED_TO_MAKE_COFFEE
        STATUS_READY
      else
        STATUS_MAKING
      end
    end

    def elapsed_time(order_id)
      Time.now - @orders[order_id]["time_of_order"]
    end
  end
end
