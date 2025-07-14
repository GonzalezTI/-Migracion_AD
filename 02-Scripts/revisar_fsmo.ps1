<#
Script: Revisar Roles FSMO
Descripción: Muestra qué servidores tienen asignados los 5 roles FSMO
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$output = "C:\\TEMP\\roles_FSMO_$fecha.txt"

netdom query fsmo | Out-File -FilePath $output -Encoding utf8

Write-Output "Roles FSMO exportados a: $output"
