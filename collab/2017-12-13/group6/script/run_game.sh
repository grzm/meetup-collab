#!/bin/sh

set -eux

lein uberjar
halite -i log -d "240 160" "java -jar target/MyBot.jar" "java -jar target/MyBot.jar"
