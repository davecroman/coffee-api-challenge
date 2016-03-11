require 'pacto'
require 'pacto/rspec'

WebMock.allow_net_connect!

Pacto.configure do |c|
  c.contracts_path = 'contracts'
end

Pacto.generate!

