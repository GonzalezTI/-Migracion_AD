Get-ADUser -Filter * -Properties PasswordNeverExpires |
Where-Object { $_.PasswordNeverExpires -eq $true } |
Export-Csv "C:\TEMP\SeguridadAD\PwdNuncaExpira.csv" -NoTypeInformation

Get-ADUser -Filter * -Properties PasswordNotRequired |
Where-Object { $_.PasswordNotRequired -eq $true } |
Export-Csv "C:\TEMP\SeguridadAD\PwdNoRequerida.csv" -NoTypeInformation

Get-ADUser -Filter * -Properties PasswordLastSet |
Where-Object { $_.PasswordLastSet -lt (Get-Date).AddDays(-180) } |
Export-Csv "C:\TEMP\SeguridadAD\PwdAntiguas.csv" -NoTypeInformation

Get-ADUser -Filter * -Properties CannotChangePassword |
Where-Object { $_.CannotChangePassword -eq $true } |
Export-Csv "C:\TEMP\SeguridadAD\PwdNoCambiable.csv" -NoTypeInformation
