### To run the app and the contracts
```bash
./go.sh
```

### To run only unit tests
```bash
bundle exec rake test
```

### To run only the contracts
```bash
bundle exec rake pacto:validate['http://localhost:8080','contracts']
```

### To change port number
1. Modify `lib/app.rb` line 47
```ruby
set :port, 8080
```
2. Change `8080` to your desired port number

### CI Pipeline
https://snap-ci.com/davecroman/coffee-api-challenge/branch/master

### Production Endpoint
https://coffee-store.herokuapp.com/menu

### Service Guarantees
Our baristas ensure that it takes exactly 60 seconds to prepare any cup of coffee no matter how long the queue is.

### Disclaimer
This is our first time doing a Ruby application from scratch so take all the implementation in this codebase with a grain of salt

### Authors
Armond Ave and Michael Huzevka

bundle exec rake pacto:validate['http://localhost:8080','contracts']