<#
Script: Exportar usuarios de Active Directory
Descripción: Lista todos los usuarios del dominio y exporta nombre, SAMAccountName, estado y descripción.
Requisitos: Ejecutar como administrador en un controlador de dominio o equipo con RSAT
#>

$fecha = Get-Date -Format "yyyyMMdd_HHmm"
$output = "C:\\TEMP\\usuarios_AD_$fecha.csv"

Get-ADUser -Filter * -Property Name, SamAccountName, Enabled, Description |
Select-Object Name, SamAccountName, Enabled, Description |
Export-Csv -Path $output -NoTypeInformation

Write-Output "Usuarios exportados a: $output"
