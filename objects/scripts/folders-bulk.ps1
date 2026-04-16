$folders = @("15-03-1923","15-05-1923","15-07-1922","15-10-1922","31-08-1922") 

foreach ($f in $folders) {
    $path = Join-Path $PWD $f 
    New-Item -ItemType Directory -Path (Join-Path $path "images") -Force
}

Get-ChildItem "*.jpg" | ForEach-Object {

    if ($_.Name -match "^(Femina-\d{2}-\d{2}-\d{4})_p(\d+)\.jpg$") {

        $date = $matches[1]
        $page = [int]$matches[2]

        $newName = "{0}_page-{1}.jpg" -f $date, $page

        Rename-Item $_.FullName -NewName $newName
    }
}

Get-ChildItem "*.xml" | ForEach-Object {

    if ($_.Name -match "^(Femina-\d{2}-\d{2}-\d{4})_p(\d+)\.xml$") {

        $date = $matches[1]
        $page = [int]$matches[2]

        $newName = "{0}_P{1:D2}.xml" -f $date, $page

        Rename-Item $_.FullName -NewName $newName
    }
}