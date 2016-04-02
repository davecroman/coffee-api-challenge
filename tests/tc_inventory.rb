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
  end
end
