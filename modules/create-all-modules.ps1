$filenames = Get-ChildItem -path .\ -filter *.mod -file -ErrorAction silentlycontinue -recurse

foreach ($filename in $filenames)
{
	$folder = $filename.directoryname+"\"+$filename.basename
	$file = $filename.fullname
	$files = Get-ChildItem $folder | % { $_.FullName }
	& 'C:\Program Files (x86)\KotOR Tools\Xoreos Tools\erf' --mod --v10 $file $files
}

Read-Host -Prompt "`nPress Enter to exit"
exit
