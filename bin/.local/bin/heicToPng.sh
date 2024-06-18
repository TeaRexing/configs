#!/bin/bash
for f in *.HEIC
do
  heif-convert -q 75 "$f" "$f.png"
done
