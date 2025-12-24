#!/bin/bash

MOVIES=( "PUSHPA" "RRR" "DEVARA")
# INDEXING STARTS FROM 0,SIZE IS 3

echo "first movie is :: ${MOVIES[0]}"
echo "second movie is :: ${MOVIES[1]}"
echo "third movie is :: ${MOVIES[2]}"

echo "All movies are :: ${MOVIES[@]}"

