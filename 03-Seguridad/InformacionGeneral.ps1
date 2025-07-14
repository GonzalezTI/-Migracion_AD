(Get-ADUser -Filter *).Count | Out-File "C:\TEMP\SeguridadAD\TotalUsuarios.txt"
(Get-ADComputer -Filter *).Count | Out-File "C:\TEMP\SeguridadAD\TotalEquipos.txt"

(Get-ADDomain).DomainMode | Out-File "C:\TEMP\SeguridadAD\NivelDominio.txt"

Get-ADDomainController -Filter * |
Export-Csv "C:\TEMP\SeguridadAD\ControladoresDominio.csv" -NoTypeInformation

netdom query fsmo > "C:\TEMP\SeguridadAD\RolesFSMO.txt"
