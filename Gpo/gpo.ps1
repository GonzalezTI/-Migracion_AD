$OutputPath = "C:\TEMP\GPO_Reports"

# Crea la carpeta si no existe
If (-not (Test-Path $OutputPath)) {
    New-Item -Path $OutputPath -ItemType Directory -Force
    Write-Host "Carpeta de salida creada: $OutputPath" -ForegroundColor Green
}

Write-Host "Iniciando la recopilación de información de GPOs..." -ForegroundColor Yellow

# 1. Obtener todas las GPOs y exportar un resumen a CSV
Write-Host "Obteniendo un resumen de todas las GPOs y exportando a CSV..." -ForegroundColor Cyan
Try {
    Get-GPO -All | Select-Object DisplayName, Id, Owner, CreationTime, ModificationTime, UserEnabled, ComputerEnabled, GpoStatus |
    Export-Csv "$OutputPath\GPO_Summary.csv" -NoTypeInformation -Encoding UTF8

    Write-Host "Resumen de GPOs exportado a: $OutputPath\GPO_Summary.csv" -ForegroundColor Green
}
Catch {
    Write-Host "Error al exportar el resumen de GPOs: $($_.Exception.Message)" -ForegroundColor Red
}

# 2. Generar informes HTML detallados para cada GPO
Write-Host "Generando informes HTML detallados para cada GPO. Esto puede tardar..." -ForegroundColor Cyan
$gpos = Get-GPO -All

If ($gpos) {
    ForEach ($gpo in $gpos) {
        $gpoName = $gpo.DisplayName -replace "[\\/:*?`"<>|]", "" # Limpia el nombre para usarlo en la ruta del archivo
        $reportPath = Join-Path $OutputPath "$gpoName.html"

        Try {
            $gpo | Get-GPOReport -ReportType Html -Path $reportPath

            Write-Host "Reporte HTML para '$($gpo.DisplayName)' generado en: $reportPath" -ForegroundColor Green
        }
        Catch {
            Write-Host "Error al generar el reporte HTML para '$($gpo.DisplayName)': $($_.Exception.Message)" -ForegroundColor Red
        }
    }
} Else {
    Write-Host "No se encontraron GPOs en el dominio." -ForegroundColor Yellow
}

Write-Host "Recopilación de información de GPOs finalizada." -ForegroundColor Yellow