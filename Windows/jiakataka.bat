taskkill /im student.exe /im smonitor.exe /f &
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /f
taskkill /IM explorer.exe /F &
explorer