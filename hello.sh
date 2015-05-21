#!/bin/bash

i=0
while [ $i -lt 1000000 ]; do
    echo hello
    i=$(( i + 1 ))
done
