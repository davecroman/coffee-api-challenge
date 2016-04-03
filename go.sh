#!/usr/bin/env bash

function run_unit_tests {
	bundle exec rake test
}

function run_app {
	(cd lib && ruby app.rb &)
}

function run_pacto_tests {
	bundle exec rake pacto:validate['http://localhost:4567','contracts']
}

function kill_application {
	kill -9 $(lsof -i:4567 | awk -F ' ' 'FNR == 2 {print $2}')
	echo "Sinatra app is now shutting down..."
	sleep 2
}

bundle install

if [ "$1" == 'unit-test' ]; then
	run_unit_tests
elif [ "$1" == 'pacto-test' ]; then
	run_app
	run_pacto_tests
	kill_application
elif [ "$1" == 'run-app' ]; then
	run_app
else
	if run_unit_tests ; then
		run_app
		run_pacto_tests
		echo "SUCCESS!!!"
	else
		echo "Test failed" 1
	fi
	kill_application
fi






