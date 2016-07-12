function Get-Snoverism {
<#
.Synopsis
   Getting the quotes from the website: http://snoverisms.com/.
.DESCRIPTION
   This function randomly gets one famous Jeffery Snover quotes from the http://snoverisms.com/.
   If specified with -talk, PowerShell will also read you the wisdom with the Windows desktop speechsynthesizer.
.EXAMPLE
   PS C:\WINDOWS\system32> Get-Snoverism
    Did you just lick my cookie?
#>
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [string]$uri = 'http://snoverisms.com/',
        
        # When used, the computer will output the text in speech as well.
        [switch]$talk  
    )
    
    Begin{
        
        $result = (Invoke-WebRequest -Uri $uri).Images.title | Where-Object {$_} | Get-Random
        Write-Verbose "Result is $result"
    }
    
    Process{

        $result

        if ($talk){
            Write-Verbose "-talk parameter specified."
            Add-Type -AssemblyName System.speech
            $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
            $speak.Speak("$result")
        }
    }
    
    End{
    }        
}
