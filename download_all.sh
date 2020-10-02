#!/bin/bash

NUM_PROBLEMS=$(./ssget -n)
NUM_PROBLEMS=2
TOTAL_SIZE=0

for (( i=1; i <= ${NUM_PROBLEMS}; ++i )); do
    # ./ssget -i $i -j
    ARCHIVE=$(./ssget -i $i -f)
    tar -xvf ${ARCHIVE}
    SIZE=($(du -k ${ARCHIVE}))
    echo "${ARCHIVE}: ${SIZE}KB"
    TOTAL_SIZE=$((${TOTAL_SIZE} + ${SIZE}))
done

echo "Total: ${TOTAL_SIZE}KB"

find dataset -name '*.tar.gz' -execdir tar -xzvf '{}' \;

find dataset -name '*.tar.gz' -exec rm {} \;
