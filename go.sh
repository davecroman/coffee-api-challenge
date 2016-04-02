#!/usr/bin/env bash
if bundle exec rake test ; then
	(cd lib && ruby app.rb)
else
	echo "Test failed" 1
fi

