# PowerShell Configuration

# PS Prompt
  function prompt 
{
  $dateTime = get-date -Format "HH:mm:ss"
  $currentDir = $(Get-Location)
  " $ Julian = Time: $dateTime
  $currentDir PowerShell > "
}

# PS Aliases
  function dev { cd C:\CMD }
  function home { cd ~ }
  function fetch { winfetch -image "C:\Users\julia\Documents\wallpapers\lizard.jpg" }

 
