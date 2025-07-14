<#
Script: Exportar GPOs aplicadas localmente
Descripción: Genera un reporte HTML de las GPOs que afectan al sistema actual.
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$output = "C:\\TEMP\\gpresult_$fecha.html"

gpresult /h $output

Write-Output "Reporte de GPOs exportado a: $output"
