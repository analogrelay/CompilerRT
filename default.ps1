Include "..\..\Tools\Psakelib.ps1"

properties {
    $Arch = "i386"
    Project "CompilerRT" -Type "StaticLibrary" -NoDefaultSourceDirs -NoDefaultIncludeDirs
    IncludeDir "include","..\Oxygen.Crt\includes"
    Reference "../Oxygen.Crt"
    IncludeDir "SDKs\linux\usr\include"
    SourceDir "lib","lib/$Arch"
    $CommonFlags = @("-ffreestanding -fno-rtti -fno-exceptions".Split())
    CFlags $CommonFlags
    CCFlags $CommonFlags
}
Task default -Depends build
Task clean -Depends clean_build