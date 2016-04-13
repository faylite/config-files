# Aliases
# Directory listing
Set-Alias -name "l" -value "Get-ChildItem"
# Clear screen
Set-Alias -name "c" -value "Clear-Host"
# Go up a directory
Function ..
{
	cd ..
}
# Clear screen and do directory listing
Function cl
{
	clear
	ls
}
# Go to home directory
Function home { Set-Location $HOME }
# Change into directory and list items
Function cdl { Set-Location $args; Get-ChildItem }
# Reload powershell profile
Function reload { & $PROFILE }

# Git Shortcuts
# Functions for common git commands
Function Git-Add { git add $args }
Function Git-Commit { git commit $args }
Function Git-Push 	{ git push $args }
Function Git-Log 	{ git log --graph --oneline --decorate --abbrev-commit --all }
Function Git-Status { git status }
# Aliases 
Set-Alias -name "g"  -value "git" -Option AllScope -Force
Set-Alias -name "ga" -value "Git-Add" -Option AllScope -Force
Set-Alias -name "gc" -value "Git-Commit" -Option AllScope -Force
Set-Alias -name "gp" -value "Git-Push" -Option AllScope -Force
Set-Alias -name "gl" -value "Git-Log" -Option AllScope -Force
Set-Alias -name "gs" -value "Git-Status" -Option AllScope -Force
Set-Alias -name "s" -value "Git-Status" -Option AllScope -Force

# Vim
Set-Alias -name "vim" -value "C:/Program Files (x86)/Vim/Vim74/./vim.exe"

# To edit the Powershell Profile
# (Not that I'll remember this)
Function Edit-Profile
{
    vim $profile
}

# To edit Vim settings
Function Edit-Vimrc
{
    vim $HOME\_vimrc
}
