#!/bin/bash

d=$(date +%Y%m%d)
oldd=$(grep filename potter.json | cut -d '-' -f 3)
md5=$(md5sum ../lineage/out/target/product/potter/lineage-X-17.1-"${d}"-UNOFFICIAL-potter.zip | cut -d ' ' -f 1)
oldmd5=$(grep '"id"' potter.json | cut -d':' -f 2)
utc=$(grep ro.build.date.utc ../lineage/out/target/product/potter/system/build.prop | cut -d '=' -f 2)
oldutc=$(grep datetime potter.json | cut -d ':' -f 2)
size=$(wc -c ../lineage/out/target/product/potter/lineage-X-17.1-"${d}"-UNOFFICIAL-potter.zip | cut -d ' ' -f 1)
oldsize=$(grep size potter.json | cut -d ':' -f 2)
oldurl=$(grep url potter.json | cut -d ' ' -f 8)
url=https://master.dl.sourceforge.net/project/zjrdroid/potter/lineage/lineage-X-17.1-"${d}"-UNOFFICIAL-potter.zip

# This is where the magic happens


sed -i "s!${oldmd5}! \"${md5}\",!g" potter.json
sed -i "s!${oldutc}! \"${utc}\",!g" potter.json
sed -i "s!${oldsize}! \"${size}\",!g" potter.json
sed -i "s!${oldd}!${d}!" potter.json
sed -i "s!${oldurl}!\"${url}\",!g" potter.json
