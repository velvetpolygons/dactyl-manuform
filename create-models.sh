#!/bin/bash

SCAD_DIR="/app/things"

for file in "$SCAD_DIR"/*.scad; do
    base=$(basename "$file" .scad)
    echo "Generating $base.stl..."
    openscad -o "$SCAD_DIR/$base.stl" "$file"
done

echo "All STL files generated."
