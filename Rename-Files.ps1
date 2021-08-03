  
$newPrefix = Read-Host "Enter New Prefix for Files"

$SourceFolder = "TestFiles"
$DestinationFolder = "NewFiles"

New-Item -ItemType Directory $DestinationFolder -ErrorAction SilentlyContinue

$wavFiles = (Get-Item $SourceFolder\*\*.wav)

ForEach ( $wavFile in $wavFiles ) {
  $ItemNumber = $wavFile.Name
  $ItemNumber.Name
  $newName = $wavFile.Name -Replace "ZOOM",$newPrefix -Replace "_TR1",""
  $fileName = $wavFile.Name
  Write-Host "Renaming $fileName to $newName"
  Move-Item $wavFile $DestinationFolder\$newName 
}
