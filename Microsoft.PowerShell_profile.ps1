# Store SSH shortcut separatly
Import-Module -Name C:\Users\RFC-22-03\Documents\WindowsPowerShell\ssh.ps1

# Set auto complete to work like bash ❤
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# Replace wierd windew curl with the real one
del alias:curl -Force
New-Alias -Name curl -Value curl.exe

# Git
function back { git reset --soft HEAD~1 }

function add { git add * }

function commit { 
  [CmdletBinding()]
  param (
    [Parameter(Mandatory, Position = 0)]
    [string[]]$CommitMessage
  ) 
  git commit -m $CommitMessage
}

function feat {
  [CmdletBinding()]
  param (
    [Parameter(Mandatory, Position = 0)]
    [string[]]$CommitMessage
  ) 
  git commit -m "feat: $CommitMessage"
}

function test-ci { git add * ; git commit --amend -m "ci: updating pipeline" ; git push origin -f }



# Evironnment Initialization 
function rlog_ini { 
	cd .\rlogApi\ ;  
	.\venv_rlog_api\Scripts\activate 
}

function bactrack_ini { 
	cd .\bactrackApi\ ;  
	pipenv shell; 
	echo test;
	SetBactrackPrompt;	
}

New-Alias -Name ini -Value bactrack_ini


# Application specifique shorcut
## Flask 
New-Alias -Name flaks -Value flask

New-Alias -Name frun -Value flask_debug

function flask_debug {$env:FLASK_DEBUG="True"; flask run --host=0.0.0.0}

## Celery
function cel { celery -A celery_app:app worker --loglevel=INFO --concurrency 1 -P solo }

## Docker
function dc_rebuild { docker-compose down --remove-orphans ; docker-compose build --build-arg VITE_ENVIRONNEMENT=dev ; [console]::beep(500,1000); docker-compose up }


# Various Alias
New-Alias -Name dc -Value docker-compose

New-Alias -Name st -Value schemathesis

New-Alias -Name mongo -Value mongosh





