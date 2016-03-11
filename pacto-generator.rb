require 'pacto'

WebMock.allow_net_connect!

Pacto.configure do |c|
  c.contracts_path = 'contracts'
end

Pacto.generate!

client = HTTPClient.new
puts client.get_content('http://localhost:4567/menu')
puts client.get_content('http://localhost:4567/order/123')
puts client.post('http://localhost:4567/order/long-black', '{"size":"small"}')
