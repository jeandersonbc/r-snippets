#!/bin/bash
./gendata.py
R --vanilla --quiet --slave < histogram.R
for f in $(ls | grep *.pdf); do
    pdfcrop $f $f
done
