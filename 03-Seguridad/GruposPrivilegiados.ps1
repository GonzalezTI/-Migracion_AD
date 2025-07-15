Get-ADGroupMember "Admins. del dominio" |
Export-Csv "C:\TEMP\SeguridadAD\DomainAdmins.csv" -NoTypeInformation

Get-ADGroupMember "Administradores de organización" |
Export-Csv "C:\TEMP\SeguridadAD\EnterpriseAdmins.csv" -NoTypeInformation

Get-ADGroupMember "Administrators" |
Export-Csv "C:\TEMP\SeguridadAD\Administrators.csv" -NoTypeInformation

Get-ADGroupMember "Replicator" |
Export-Csv "C:\TEMP\SeguridadAD\Replicator.csv" -NoTypeInformation
