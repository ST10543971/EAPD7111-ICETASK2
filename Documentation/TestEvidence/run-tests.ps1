<#
Runs unit tests and writes a TRX test result into this folder.
Usage: Open PowerShell in the repository root and run:
  .\Documentation\TestEvidence\run-tests.ps1
#>

$ErrorActionPreference = 'Stop'

# Determine repository root (Documentation/TestEvidence -> repo root is two levels up)
$scriptDir = $PSScriptRoot
$repoRoot = Resolve-Path (Join-Path $scriptDir '..\..') -ErrorAction SilentlyContinue
if (-not $repoRoot) { $repoRoot = Resolve-Path $scriptDir -ErrorAction SilentlyContinue }

Write-Host "Repository root: $($repoRoot.Path)"

# Find a test project (prefer named TechMove.Tests)
$testProj = Get-ChildItem -Path $repoRoot.Path -Recurse -Filter "TechMove.Tests.csproj" -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $testProj) {
	$testProj = Get-ChildItem -Path $repoRoot.Path -Recurse -Filter "*.Tests.csproj" -ErrorAction SilentlyContinue | Select-Object -First 1
}

if ($testProj) {
	Write-Host "Running tests for: $($testProj.FullName)"
	dotnet test $testProj.FullName --logger:"trx;LogFileName=TestResults.trx" --results-directory $scriptDir
} else {
	Write-Host "No test project found. Running 'dotnet test' for the solution (if present)."
	dotnet test $repoRoot.Path --logger:"trx;LogFileName=TestResults.trx" --results-directory $scriptDir
}

Write-Host "Results written to: $scriptDir\TestResults.trx"
