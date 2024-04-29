# Import the WebAdministration module
Import-Module WebAdministration

# List all sites
$sites = Get-Website
Write-Host "IIS Sites:"
foreach ($site in $sites) {
    Write-Host "  - Site Name: $($site.Name)"
    Write-Host "    - State: $($site.State)"
    Write-Host "    - Physical Path: $($site.PhysicalPath)"
    
    # List all applications within the site
    Write-Host "    - Applications:"
    $apps = Get-WebApplication -Site $site.Name
    foreach ($app in $apps) {
        Write-Host "      - Application Path: $($app.Path)"
        Write-Host "        - Physical Path: $($app.PhysicalPath)"
    }
}

# List all modules
Write-Host "`nIIS Modules:"
$modules = Get-WebGlobalModule
foreach ($module in $modules) {
    Write-Host "  - Module Name: $($module.Name)"
    Write-Host "    - Image: $($module.Image)"
}

Write-Host "`nScript execution completed."
