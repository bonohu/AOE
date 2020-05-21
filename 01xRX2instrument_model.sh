#!/bin/sh
# script to get metadata from xRX.json

# run

gzip -dc xRX.json.gz \
| perl 01xRX2instrument_model.pl \
| gzip -c \
> xRX2instrument_model.txt.gz

