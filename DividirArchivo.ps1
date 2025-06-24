## DIVIDIR ARCHIVO EN VARIAS PARTES - POWERSHELL
$InputFile = "C:\Ruta\archivo.csv"
$RowLimit = 1000000
$Header = Get-Content $InputFile -First 1
$Lines = Get-Content $InputFile | Select-Object -Skip 1

$Index = 1
$Lines | ForEach-Object -Begin { $i = 0 } -Process {
    if ($i % $RowLimit -eq 0) {
        $OutFile = "C:\Ruta\archivo_part$Index.csv"
        $Header | Out-File -FilePath $OutFile
        $Index++
    }
    $_ | Out-File -Append -FilePath $OutFile
    $i++
}
