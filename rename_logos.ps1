# PowerShell script to rename logo files according to convention
$directories = @(
    "assets/logos/chatbots",
    "assets/logos/image-generation",
    "assets/logos/development",
    "assets/logos/video-audio",
    "assets/logos/business",
    "assets/logos/mobile-apps"
)

foreach ($dir in $directories) {
    Get-ChildItem -Path $dir -Filter "*.png" | ForEach-Object {
        $newName = $_.Name.ToLower() -replace " ", "-" -replace "_", "-" -replace "--", "-"
        if ($newName -ne $_.Name) {
            Rename-Item -Path $_.FullName -NewName $newName
            Write-Host "Renamed: $($_.Name) -> $newName"
        }
    }
} 