Get-ADUser -Filter * -Properties ServicePrincipalName |
Where-Object { $_.ServicePrincipalName -ne $null } |
Export-Csv "C:\TEMP\SeguridadAD\UsuariosConSPN.csv" -NoTypeInformation

Get-ADComputer -Filter * -Properties ServicePrincipalName |
Where-Object { $_.ServicePrincipalName -ne $null } |
Export-Csv "C:\TEMP\SeguridadAD\EquiposConSPN.csv" -NoTypeInformation
