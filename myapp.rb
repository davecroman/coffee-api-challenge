# myapp.rb
require 'sinatra'
require 'json'

get '/menu' do
  content_type :json
  return_message = {
      "coffees": [
        {
          "name": "long black",
          "order_path": "/order/long-black",
          "price": 3,
          "caffeine_level": 8,
          "milk_ratio": 0
        },
        {
          "name": "flat white",
          "order_path": "/order/flat-white",
          "price": 3.5,
          "caffeine_level": 5,
          "milk_ratio": 2
        },
        {
          "name": "latte",
          "order_path": "/order/latte",
          "price": 3.5,
          "caffeine_level": 5,
          "milk_ratio": 3
        },
        {
          "name": "machiato",
          "order_path":" /order/machiato",
          "price": 2.5,
          "caffeine_level": 10,
          "milk_ratio": 0.5
        }
    ]
	}
  return_message.to_json;
end