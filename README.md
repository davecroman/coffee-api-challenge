Run: 
- ruby coffee-api.rb
- bundle exec rake pacto:validate['http://localhost:4567','contracts']





Idea 
- wrap the pacto tests in a docker container
- get participants to pull down this repo
- give them a command like: docker run pacto-tests localhost:8080/
- they run them, they go red, they make them pass

Get Menu
- return list of coffees
- link to order each one

Order
- coffee id
- sugar
- milk
- size
- returns link to order status

Get Order Status
- order id
- returns either link to order status
- or done

Rate Coffee Feedback
- order id
- star rating
- returns thanks


