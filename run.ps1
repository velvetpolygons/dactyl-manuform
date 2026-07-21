# Powershell script to use docker compose containers to create output files.
param(
    [string]$cmd
)

# Generate openscad files if cmd is "scad" or "all"
if ($cmd -eq "scad" -or $cmd -eq "all") {
    docker compose run --rm clojure lein generate
}

# Generate stl files if cmd is "create-models" or "all"
if ($cmd -eq "stl" -or $cmd -eq "all") {
    docker compose run --rm openscad bash /app/create-models.sh
}

# Show help if command is unknown
if ($cmd -notin @("scad", "stl", "all")) {
    Write-Host "Unknown command: $cmd"
    Write-Host ""
    Write-Host "Usage:"
    Write-Host "  ./run scad"
    Write-Host "  ./run stl"
    Write-Host "  ./run all"
}
