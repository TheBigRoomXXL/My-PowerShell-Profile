Import-Module -Name C:\Users\RFC-22-03\Documents\WindowsPowerShell\ssh.ps1

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

function cel { celery -A celery_app:app worker --loglevel=INFO --concurrency 1 -P solo }

function flask_debug {$env:FLASK_DEBUG="True"; flask run --host=0.0.0.0}

function dc_rebuild { docker-compose down --remove-orphans ; docker-compose build --build-arg VITE_ENVIRONNEMENT=dev ; [console]::beep(500,1000); docker-compose up }

# 

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


function test-ci { git add * ; git commit --amend -m "ci: updating pipeline" ; git push origin -f }



del alias:curl -Force


New-Alias -Name ini -Value bactrack_ini

New-Alias -Name flaks -Value flask

New-Alias -Name frun -Value flask_debug

New-Alias -Name dc -Value docker-compose

New-Alias -Name st -Value schemathesis

New-Alias -Name mongo -Value mongosh

New-Alias -Name curl -Value curl.exe

Set-PSReadlineKeyHandler -Key Tab -Function Complete


