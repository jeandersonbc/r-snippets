#!/bin/bash
R --vanilla --quiet --slave < histogram.R
for f in $(ls | grep *.pdf); do
    pdfcrop $f $f
done
