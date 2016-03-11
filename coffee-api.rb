require 'sinatra'
require 'json'

get '/menu' do
  content_type :json
  status 200
  { 
    long_black: '/order/long-black', 
    flat_white: '/order/flat-white', 
    latte: '/order/latte', 
    espresso: '/order/espresso', 
    machiato: '/order/machiato'
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
    order: "/order/123"
  }.to_json
end
