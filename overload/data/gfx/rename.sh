#!/bin/bash

cd shockbolt
for i in $(ls); do
    mv $i ${i/.png/_default.png}
done


