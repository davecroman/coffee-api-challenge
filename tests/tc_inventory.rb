require "test/unit"
require "inventory"

module CoffeeStore
  class CoffeeInventoryTest < Test::Unit::TestCase

    def setup
      @inventory = CoffeeInventory.new
    end

    def test_add_order_returns_order_id
      order_id = @inventory.add_order({}, "coffee")
      assert order_id == 1
    end

    def test_add_order_increments_order_id
      @inventory.add_order({}, "coffee")
      order_id = @inventory.add_order({}, "coffee")
      assert order_id == 2
    end

    def test_add_order_should_add_time_of_order
      order_id = @inventory.add_order({}, "coffee")
      assert @inventory.orders[order_id].key?("time_of_order")
      assert @inventory.orders[order_id]["time_of_order"].class == Time
    end

    def test_order_status_should_return_MAKING_if_time_elapsed_less_than_60_seconds
      order_id = @inventory.add_order({}, "coffee")

      assert @inventory.order_status(order_id) == "MAKING"
    end

    def test_order_status_should_return_READY_if_time_elapsed_greater_than_59_seconds
      order_id = @inventory.add_order({}, "coffee")

      @inventory.orders[order_id]["time_of_order"] -= 60

      assert @inventory.order_status(order_id) == "READY"
    end

    def test_order_status_should_return_NO_SUCH_ORDER_if_order_id_inexistent
      assert @inventory.order_status(32) == "NO_SUCH_ORDER"
    end
  end
end
