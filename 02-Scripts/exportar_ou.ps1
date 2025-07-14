<#
Script: Exportar Unidades Organizativas (OU)
Descripción: Muestra las OUs del dominio con su DistinguishedName.
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$output = "C:\\TEMP\\ou_AD_$fecha.csv"

Get-ADOrganizationalUnit -Filter * |
Select-Object Name, DistinguishedName |
Export-Csv -Path $output -NoTypeInformation

Write-Output "OUs exportadas a: $output"
