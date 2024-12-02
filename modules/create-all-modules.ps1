$filenames = Get-ChildItem -path .\ -filter *.mod -file -ErrorAction silentlycontinue -recurse

foreach ($filename in $filenames)
{
	$folder = $filename.directoryname+"\"+$filename.basename
	$file = $filename.fullname
	$name = $filename.basename
	$directory = $filename.directoryname
	$matching = Get-ChildItem $directory -Directory | Where-Object { $_.Name -match $name }
	$match = $matching.fullname
	$files = Get-ChildItem $match | % { $_.FullName }
	& 'C:\Program Files (x86)\KotOR Tools\Xoreos Tools\erf' --mod --v10 $file $files
}

exit
