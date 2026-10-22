param([switch]$TestCities)
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
$originalKey = $env:OPENAI_API_KEY
try {
    $runtimePython = Join-Path $PSScriptRoot '../../work/day3/.venv/Scripts/python.exe'
    $projectPython = Join-Path $PSScriptRoot '.venv/Scripts/python.exe'
    if (Test-Path -LiteralPath $projectPython) { $pythonExe = $projectPython }
    elseif (Test-Path -LiteralPath $runtimePython) { $pythonExe = $runtimePython }
    else { $pythonExe = 'python' }
    if (-not $env:OPENAI_API_KEY) {
        $secureKey = Read-Host 'Enter your OpenAI API key privately (input is hidden)' -AsSecureString
        $keyPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureKey)
        try { $env:OPENAI_API_KEY = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($keyPointer) }
        finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($keyPointer) }
    }
    if (-not $env:MODEL) { $env:MODEL = 'openai/gpt-4o-mini' }
    if ($TestCities) {
        New-Item -ItemType Directory -Force 'logs' | Out-Null
        foreach ($testCity in @('Jaipur', 'Chennai', 'Paris')) {
            Write-Host "`n===== $testCity ====="
            $testCity | & $pythonExe travel_planner.py 2>&1 | Tee-Object -FilePath (Join-Path 'logs' "$testCity.txt")
            if ($LASTEXITCODE -ne 0) { throw "The $testCity run failed. Check the error above before continuing." }
        }
    }
    else {
        & $pythonExe travel_planner.py
    }
}
finally {
    $env:OPENAI_API_KEY = $originalKey
}
Read-Host 'Press Enter to close'
