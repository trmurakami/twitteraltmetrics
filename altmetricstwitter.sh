#!/bin/bash
link="http://urls.api.twitter.com/1/urls/count.json?url=" 
echo -e "count\turl" > outputtwitter.csv

cat $1 | while read lin ; do curl $link$lin | jq -r '. | .count,.url' | tr "\n" "\t" | cat - <(echo) >> outputtwitter.csv ; done;