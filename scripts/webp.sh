#!/bin/sh
find -E . -type f -regex '.*\.(png|jpg)' -print0 | xargs -0 -I{} cwebp -q 90 {} -o {}.webp

rm -rf webp
mkdir webp
for f in ./*.webp
do
    mv $f webp/`echo ${f} | sed -E 's/\.(png|jpg)\.webp/.webp/'`
done
