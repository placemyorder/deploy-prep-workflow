param(
    [parameter(Mandatory=$true)]
    [String]$branch,
    [parameter(Mandatory=$true)]
    [String]$versionFile
)
Write-Host "Branch: $branch"
Write-Host "Version File: $versionFile"
$fileVersion = [version](Get-Content $versionFile)
$stringArray = $branch.ToString().Split("/")
$major = $fileVersion.Major
$minor = $fileVersion.Minor
$patch = $fileVersion.Build

if($stringArray[0] -eq "release")
{
    $major = $major + 1
}

if($stringArray[0] -eq "feature")
{
    $minor = $minor + 1
}

if($stringArray[0] -eq "bug")
{
    $patch = $patch + 1
}

$version = "$major.$minor.$patch"
Set-Content $versionFile $version