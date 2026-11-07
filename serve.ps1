# GharDoot Local Web Server (Zero-dependency PowerShell HTTP Server)
param (
    [int]$Port = 8080
)

$rootDir = $PSScriptRoot
if (-not $rootDir) { $rootDir = Get-Location }

# Get local Wi-Fi IP address
$ip = "localhost"
try {
    $ipConfig = ipconfig | Select-String -Pattern "IPv4 Address[ .:]+([\d\.]+)"
    if ($ipConfig -and $ipConfig.Matches.Groups.Count -gt 1) {
        $ip = $ipConfig.Matches[0].Groups[1].Value
    }
} catch {}

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".svg"  = "image/svg+xml"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".webp" = "image/webp"
    ".ico"  = "image/x-icon"
}

$listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Any, $Port)
try {
    $listener.Start()
} catch {
    # If 8080 is in use, fallback to 8081
    $Port = 8081
    $listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Any, $Port)
    $listener.Start()
}

Write-Host "==========================================================" -ForegroundColor Green
Write-Host "   GharDoot Local Mobile Server Started!" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Green
Write-Host ""
Write-Host "   PC Browser URL:        http://localhost:$Port" -ForegroundColor Cyan
Write-Host "   Android Phone URL:     http://$($ip):$Port" -ForegroundColor Yellow
Write-Host ""
Write-Host "   Make sure your Android phone is on the same Wi-Fi network!" -ForegroundColor Gray
Write-Host "   Press Ctrl+C to stop the server." -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Green

while ($true) {
    try {
        $client = $listener.AcceptTcpClient()
        [System.Threading.Tasks.Task]::Run({
            param($c, $root, $types)
            try {
                $stream = $c.GetStream()
                $reader = New-Object System.IO.StreamReader($stream)
                $requestLine = $reader.ReadLine()
                if (-not $requestLine) { $c.Close(); return }

                $tokens = $requestLine.Split(" ")
                if ($tokens.Length -lt 2) { $c.Close(); return }
                $urlPath = $tokens[1].Split("?")[0]
                if ($urlPath -eq "/" -or $urlPath -eq "") { $urlPath = "/index.html" }
                
                # Replace url separators and security check
                $localPath = [System.IO.Path]::Combine($root, $urlPath.TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar))
                $fullPath = [System.IO.Path]::GetFullPath($localPath)

                if (-not $fullPath.StartsWith([System.IO.Path]::GetFullPath($root))) {
                    $responseBytes = [System.Text.Encoding]::UTF8.GetBytes("HTTP/1.1 403 Forbidden`r`nContent-Length: 0`r`n`r`n")
                    $stream.Write($responseBytes, 0, $responseBytes.Length)
                    $c.Close()
                    return
                }

                if ([System.IO.File]::Exists($fullPath)) {
                    $bytes = [System.IO.File]::ReadAllBytes($fullPath)
                    $ext = [System.IO.Path]::GetExtension($fullPath).ToLower()
                    $mime = if ($types.ContainsKey($ext)) { $types[$ext] } else { "application/octet-stream" }
                    
                    $header = "HTTP/1.1 200 OK`r`nContent-Type: $mime`r`nContent-Length: $($bytes.Length)`r`nAccess-Control-Allow-Origin: *`r`nCache-Control: no-cache`r`nConnection: close`r`n`r`n"
                    $headerBytes = [System.Text.Encoding]::UTF8.GetBytes($header)
                    $stream.Write($headerBytes, 0, $headerBytes.Length)
                    $stream.Write($bytes, 0, $bytes.Length)
                } else {
                    $notFound = [System.Text.Encoding]::UTF8.GetBytes("HTTP/1.1 404 Not Found`r`nContent-Type: text/plain`r`nContent-Length: 9`r`n`r`nNot Found")
                    $stream.Write($notFound, 0, $notFound.Length)
                }
            } catch {
            } finally {
                $c.Close()
            }
        }.GetNewClosure(), @($client, $rootDir, $mimeTypes)) | Out-Null
    } catch {
        break
    }
}
$listener.Stop()
