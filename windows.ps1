# ------------------------------------------------------------------------------
# Basic Windows Setup Automation
#
# This is made to configure some basic sanity settings in Windows 11 to make
# the experience a bit better. Many of these things can only be set through
# manually applying GPO or registry tweaks, so this script hopefully avoids a
# lot of repeat web searches to the same annoying blogs and content spam.
#
# You'll have to run this script in the `Bypass` execution policy, as it is not
# signed. Launch powershell as an administrator, then set the new policy just
# for the current session:
#
#     Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
#
# ------------------------------------------------------------------------------

# Ensure the given registry path exists.
function Create-Path {
	param ($Path)

	if (-not (Test-Path -Path $Path))
	{
		New-Item $Path
	}
}

# Set various Windows Explorer registry keys.
function Set-ExplorerSettings {
	Set-Variable -name "ExplorerAdvancedPath" -Value "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

	Create-Path $ExplorerAdvancedPath

	# Align the Taskbar icons to the left.
	Set-ItemProperty `
		-Path $ExplorerAdvancedPath `
		-Type DWord `
		-Name "TaskbarAl" `
		-Value 0

	# Show all file extensions
	Set-ItemProperty `
		-Path $ExplorerAdvancedPath `
		-Type DWord `
		-Name "HideFileExt" `
		-Value 0
}

# Disable web suggestions in the Windows search experience.
function Disable-SearchSpam {
	Set-Variable -Name "ExplorerHKLMPath" -Value "HKLM:\Software\Policies\Microsoft\Windows\Explorer"

	Create-Path $ExplorerHKLMPath

	Set-ItemProperty `
		-Path $ExplorerHKLMPath `
		-Type DWord `
		-Name "DisableSearchBoxSuggestions" `
		-Value 1
}

# ------------------------------------------------------------------------------
# Main Execution
# ------------------------------------------------------------------------------
$ErrorActionPreference = "Stop"

Disable-SearchSpam
Set-ExplorerSettings

# vim: noexpandtab sw=4 ts=4
