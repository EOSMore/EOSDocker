#!/bin/bash

docker-compose stop
docker-compose rm -f

rm -rf block-data
rm -rf data-dir/contracts
rm -rf wallet