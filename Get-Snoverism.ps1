function Get-Snoverism {
    param(
        [string]$uri = 'http://snoverisms.com/',
        [switch]$talk  
    )
    
    $result = (Invoke-WebRequest -Uri $uri).Images.title | Where-Object {$_} | Get-Random
    
    $result

    if ($talk){
        Add-Type -AssemblyName System.speech
        $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $speak.Speak("$result")
    }
}
