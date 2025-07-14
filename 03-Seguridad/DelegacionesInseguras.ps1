Get-ADUser -Filter * -Properties TrustedForDelegation |
Where-Object { $_.TrustedForDelegation -eq $true } |
Export-Csv "C:\TEMP\SeguridadAD\DelegacionUsuarios.csv" -NoTypeInformation

Get-ADComputer -Filter * -Properties TrustedForDelegation |
Where-Object { $_.TrustedForDelegation -eq $true } |
Export-Csv "C:\TEMP\SeguridadAD\DelegacionEquipos.csv" -NoTypeInformation

Get-ADComputer -Filter * -Properties TrustedToAuthForDelegation |
Where-Object { $_.TrustedToAuthForDelegation -eq $true } |
Export-Csv "C:\TEMP\SeguridadAD\DelegacionRestringida.csv" -NoTypeInformation
