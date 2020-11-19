@echo off
:: https://community.spiceworks.com/topic/949313-what-is-the-windows-variable-for-a-users-full-name-not-just-the-username

for /f "tokens=2*" %%a in ('net user "%Username%" /domain ^| find /i "Full Name"') do set DisplayName=%%b

echo %DisplayName%
