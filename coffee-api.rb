require 'sinatra'
require 'json'

get '/menu' do
  content_type :json
  status 200
  { coffees: [
    {name: 'long black',
     order_path: '/order/long-black',
     price: 3,
     caffeine_level: 8,
     milk_ratio: 0},
    {name: 'flat white',
      order_path: '/order/flat-white',
      price: 3.5,
      caffeine_level: 5,
      milk_ratio: 2},
    {name: 'latte',
      order_path: '/order/latte',
      price: 3.5,
      caffeine_level: 5,
      milk_ratio: 3},
    {name: 'espresso',
      order_path: '/order/espresso',
      price: 2,
      caffeine_level: 10,
      milk_ratio: 0},
    {name: 'machiato',
      order_path: '/order/machiato',
      price: 2.5,
      caffeine_level: 10,
      milk_ratio: 0.5}]
  }.to_json
end

get '/order/:order_id' do
  content_type :json
  status 200
  {
    status: 'READY'
  }.to_json
end

post '/order/:coffee_id' do
  content_type :json
  status 201
  {
    order: "/order/123",
    wait_time: "5"
  }.to_json
end
