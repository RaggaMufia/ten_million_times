#!/bin/bash

i=0
while [ $i -lt 10000000 ]; do
    echo hello
    i=$(( i + 1 ))
done
