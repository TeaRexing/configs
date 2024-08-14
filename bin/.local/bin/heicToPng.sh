#!/bin/bash
for f in *.HEIC
do
  heif-dec -q 75 "$f" "$f.png"
done
