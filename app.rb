# myapp.rb
require 'sinatra'
require 'json'
require './validator.rb'
require './inventory.rb'


module CoffeeStore
  class Application < Sinatra::Base

    validator = Validator.new
    inventory = CoffeeInventory.new

    get '/menu' do
      content_type :json

      response_body = {
        "coffees": inventory.items
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
