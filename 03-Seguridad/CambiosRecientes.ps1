Get-ADUser -Filter * -Properties WhenCreated |
Where-Object { $_.WhenCreated -gt (Get-Date).AddDays(-30) } |
Export-Csv "C:\TEMP\SeguridadAD\UsuariosNuevos.csv" -NoTypeInformation

Get-ADComputer -Filter * -Properties WhenCreated |
Where-Object { $_.WhenCreated -gt (Get-Date).AddDays(-30) } |
Export-Csv "C:\TEMP\SeguridadAD\EquiposNuevos.csv" -NoTypeInformation
