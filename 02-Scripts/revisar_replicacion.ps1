<#
Script: Estado de replicación de AD
Descripción: Obtiene resumen del estado de replicación entre DCs
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$output = "C:\\TEMP\\replicacion_AD_$fecha.txt"

repadmin /replsummary | Out-File -FilePath $output -Encoding utf8

Write-Output "Resumen de replicación exportado a: $output"
