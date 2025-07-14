<#
Script: Exportar servicios de un servidor remoto
Descripción: Obtiene todos los servicios del servidor remoto con su nombre, descripción, estado y tipo de inicio.
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$servidor = "NombreDeSuServidorAD"
$output = "C:\\TEMP\\servicios_AD_${servidor}_$fecha.csv"

Get-Service -ComputerName $servidor |
    Select-Object Name, DisplayName, Status, StartType |
    Export-Csv -Path $output -NoTypeInformation

Write-Output "Servicios exportados de '$servidor' a: $output"
