module CoffeeStore
  class Validator

    COFFEE_NAMES = ['long-black', 'flat-white', 'latte', 'espresso', 'machiato']

    def is_valid_coffee_name(name)
      COFFEE_NAMES.include? name.downcase
    end

    def is_valid_order_id(id)
      id =~ /\d+/
    end
  end
end
