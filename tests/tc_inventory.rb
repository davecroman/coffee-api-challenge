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
  end
end
