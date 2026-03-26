#!/bin/bash
BASE_DIR="objects"

find "$BASE_DIR" -type f -name "*.pdf" | while read pdf_file; do
    pdf_dir=$(dirname "$pdf_file")          # e.g. objects/newspapers/El_Sport_Ilustrado/1
    newspaper_dir=$(dirname "$pdf_dir")     # e.g. objects/newspapers/El_Sport_Ilustrado
    pdf_base=$(basename "$pdf_file" .pdf)   # e.g. El_Sport_Ilustrado

    image_dir="$newspaper_dir/images"
    image_prefix="$image_dir/${pdf_base}_page"

    if ls "${image_prefix}"*.jpg 2>/dev/null | grep -q .; then
        echo "Ya procesado, saltando: $pdf_file"
        continue
    fi

    mkdir -p "$image_dir"

    # Ejecutar pdftoppm
    pdftoppm -jpeg "$pdf_file" "$image_prefix"

    echo "Procesado: $pdf_file"
done