# myapp.rb
require 'sinatra'
require 'json'
require './validator.rb'

module CoffeeStore
  class Application < Sinatra::Base

    validator = Validator.new

    get '/menu' do
      content_type :json
      response_body = {
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
      response_body.to_json
    end

    get '/order/:id' do |id|
      halt 400, "Invalid id" unless validator.is_valid_order_id(id)
      content_type :json
      response_body = {
        "status": "READY"
      }
      response_body.to_json
    end

    post '/order/:coffee_name' do |coffee_name|
      halt 400, "Coffee name not found" unless validator.is_valid_coffee_name(coffee_name)

      request_body = JSON.parse request.body.read
      content_type :json

      status 201
      response_body = {
        "order": "order/123",
        "wait_time": 5
      }

      response_body.to_json
    end

    run!
  end
end
