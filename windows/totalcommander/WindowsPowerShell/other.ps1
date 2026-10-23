# PSReadLine Stuff
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Disable tab completion bell
Set-PSReadlineOption -BellStyle None

Set-PSReadLineKeyHandler Ctrl+UpArrow {
    Set-Location ..
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
 }
 
 Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
 Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
 
 Set-PSReadLineKeyHandler -Key F7 `
                          -BriefDescription History `
                          -LongDescription 'Show command history' `
                          -ScriptBlock {
     $pattern = $null
     [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$pattern, [ref]$null)
     if ($pattern)
     {
         $pattern = [regex]::Escape($pattern)
     }
 
     $history = [System.Collections.ArrayList]@(
         $last = ''
         $lines = ''
         foreach ($line in [System.IO.File]::ReadLines((Get-PSReadLineOption).HistorySavePath))
         {
             if ($line.EndsWith('`'))
             {
                 $line = $line.Substring(0, $line.Length - 1)
                 $lines = if ($lines)
                 {
                     "$lines`n$line"
                 }
                 else
                 {
                     $line
                 }
                 continue
             }
 
             if ($lines)
             {
                 $line = "$lines`n$line"
                 $lines = ''
             }
 
             if (($line -cne $last) -and (!$pattern -or ($line -match $pattern)))
             {
                 $last = $line
                 $line
             }
         }
     )
     $history.Reverse()
 
     $command = $history | Out-GridView -Title History -PassThru
     if ($command)
     {
         [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
         [Microsoft.PowerShell.PSConsoleReadLine]::Insert(($command -join "`n"))
     }
 }
 
 
 Set-PSReadLineKeyHandler -Key ')', ']', '}' `
     -BriefDescription SmartCloseBraces `
     -LongDescription 'Insert closing brace or skip' `
     -ScriptBlock {
     param($key, $arg)
 
     $line = $null
     $cursor = $null
     [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
 
     if ($line[$cursor] -eq $key.KeyChar) {
         [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
     }
     else {
         [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)")
     }
 }
 