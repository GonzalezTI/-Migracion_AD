<#
Script: Exportar grupos de Active Directory
Descripción: Lista todos los grupos del dominio con su tipo y descripción.
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$output = "C:\\TEMP\\grupos_AD_$fecha.csv"

Get-ADGroup -Filter * -Property Name, GroupScope, Description |
Select-Object Name, GroupScope, Description |
Export-Csv -Path $output -NoTypeInformation

Write-Output "Grupos exportados a: $output"
