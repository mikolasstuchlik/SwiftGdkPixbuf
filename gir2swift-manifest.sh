#!/bin/bash

GIR_NAME="GdkPixbuf-2.0"

function generate {
    echo "building"
}

case $1 in
gir-name) echo $GIR_NAME;;
generate) echo $(generate);;
esac
