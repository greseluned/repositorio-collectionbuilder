$BASE_DIR = "objects"

Get-ChildItem -Path $BASE_DIR -Recurse -Filter "*.pdf" | ForEach-Object {
    $pdf_file = $_.FullName
    $pdf_dir = $_.DirectoryName
    $pdf_base = $_.BaseName
    $newspaper_dir = Split-Path $pdf_dir -Parent

    $image_dir = Join-Path $newspaper_dir "images"
    $image_prefix = Join-Path $image_dir "${pdf_base}_page"

    if (Test-Path "${image_prefix}*.jpg") {
        Write-Host "Ya procesado, saltando: $pdf_file"
        return
    }

    New-Item -ItemType Directory -Force -Path $image_dir | Out-Null

    python objects/scripts/convert_pdf.py "$pdf_file" "$image_prefix"

    Write-Host "Procesado: $pdf_file"
}