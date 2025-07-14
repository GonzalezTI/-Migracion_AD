Get-ADGroupMember "Domain Admins" |
Export-Csv "C:\TEMP\SeguridadAD\DomainAdmins.csv" -NoTypeInformation

Get-ADGroupMember "Enterprise Admins" |
Export-Csv "C:\TEMP\SeguridadAD\EnterpriseAdmins.csv" -NoTypeInformation

Get-ADGroupMember "Administrators" |
Export-Csv "C:\TEMP\SeguridadAD\Administrators.csv" -NoTypeInformation

Get-ADGroupMember "Replicator" |
Export-Csv "C:\TEMP\SeguridadAD\Replicator.csv" -NoTypeInformation
