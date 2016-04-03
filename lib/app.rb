require 'sinatra'
require 'json'
require './validator.rb'
require './inventory.rb'

module CoffeeStore
  class Application < Sinatra::Base

    validator = Validator.new
    inventory = CoffeeInventory.new

    get '/' do
      'Welcome, to the coffee store!'
    end
    
    get '/menu' do
      content_type :json

      response_body = {
        "coffees": inventory.menu_items
      }

      response_body.to_json
    end

    get '/order/:id' do |id|
      halt 400, "Invalid id" unless validator.is_valid_order_id(id)
      content_type :json
      response_body = {
        "status": inventory.order_status(id)
      }
      response_body.to_json
    end

    post '/order/:coffee_name' do |coffee_name|
      halt 400, "Coffee name not found" unless validator.is_valid_coffee_name(coffee_name)

      order_details = JSON.parse request.body.read
      order_id = inventory.add_order(order_details, coffee_name)

      content_type :json
      status 201
      response_body = {
        "order": "order/" + order_id.to_s,
        "wait_time": CoffeeInventory::SECONDS_NEEDED_TO_MAKE_COFFEE
      }

      response_body.to_json
    end

    run!
  end
end
