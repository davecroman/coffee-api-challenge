#!/usr/bin/env bash

if bundle exec rake test ; then
	(cd lib && ruby app.rb &)
	bundle exec rake pacto:validate['http://localhost:4567','contracts']
else
	echo "Test failed" 1
fi

kill -9 $(lsof -i:4567 | awk -F ' ' 'FNR == 2 {print $2}')
echo "Sinatra app has now been shutting down..."
