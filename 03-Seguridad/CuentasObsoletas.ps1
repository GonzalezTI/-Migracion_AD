# Cuentas de usuarios inactivos por más de 90 días
Search-ADAccount -AccountInactive -UsersOnly -TimeSpan 90.00:00:00 |
Export-Csv "C:\TEMP\SeguridadAD\UsuariosInactivos.csv" -NoTypeInformation

# Cuentas de equipos inactivos por más de 90 días
Search-ADAccount -AccountInactive -ComputersOnly -TimeSpan 90.00:00:00 |
Export-Csv "C:\TEMP\SeguridadAD\EquiposInactivos.csv" -NoTypeInformation

# Cuentas deshabilitadas
Search-ADAccount -AccountDisabled |
Export-Csv "C:\TEMP\SeguridadAD\CuentasDeshabilitadas.csv" -NoTypeInformation

# Cuentas sin fecha de expiración
Get-ADUser -Filter * -Properties AccountExpirationDate |
Where-Object { $_.AccountExpirationDate -eq $null } |
Export-Csv "C:\TEMP\SeguridadAD\SinFechaExpiracion.csv" -NoTypeInformation
