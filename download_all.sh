#!/bin/bash

NUM_PROBLEMS=$(./ssget -n)

TOTAL_SIZE=0

for (( i=1; i <= ${NUM_PROBLEMS}; ++i )); do
    # ./ssget -i $i -j
    ARCHIVE=$(./ssget -i $i -f)
    SIZE=($(du -k ${ARCHIVE}))
    echo "${ARCHIVE}: ${SIZE}KB"
    TOTAL_SIZE=$((${TOTAL_SIZE} + ${SIZE}))
done

echo "Total: ${TOTAL_SIZE}KB"
