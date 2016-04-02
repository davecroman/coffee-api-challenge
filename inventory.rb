require 'json'

module CoffeeStore
  class CoffeeInventory

  	MENU_FILE = File.read('menu.json');

    def initialize()
        @menu_items = JSON.parse(MENU_FILE)
    end

    def menu_items
    	@menu_items
	end

  end
end