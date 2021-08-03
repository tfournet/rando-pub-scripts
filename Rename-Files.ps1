  
$newPrefix = Read-Host "Enter New Prefix for Files"

$SourceFolder = "TestFiles"
$DestinationFolder = "NewFiles"

New-Item -ItemType Directory $DestinationFolder -ErrorAction SilentlyContinue

$wavFiles = (Get-Item $SourceFolder\*\*.wav)

ForEach ( $wavFile in $wavFiles ) {
  $fileName = $wavFile.Name
  $newName = $fileName -Replace "ZOOM",$newPrefix -Replace "_TR1",""
  Write-Host "Renaming $fileName to $newName"
  Move-Item $wavFile $DestinationFolder\$newName 
}
