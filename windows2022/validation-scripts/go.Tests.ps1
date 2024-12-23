Write-Output "Installing golang..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") 

Describe "Golang" {
    It "Should be installed and on the path" {
        (Get-Command -Name "go") | Should -HaveCount 1
    }
}

$SoftwareName = "go"
($(go version) -match "\d+\.\d\d") -or ($(go version) -match "\d+\.\d+\.\d+")
$goVersion = $matches[0]

$Description = @"
_Version:_ $goVersion<br/>
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
