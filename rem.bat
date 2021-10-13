@echo off
echo.
echo.

echo ########  ######## ##    ##    ###    ##     ## ########    ########   ######
echo ##     ## ##       ###   ##   ## ##   ###   ### ##          ##     ## ##    ##
echo ##     ## ##       ####  ##  ##   ##  #### #### ##          ##     ## ##
echo ########  ######   ## ## ## ##     ## ## ### ## ######      ########  ##
echo ##   ##   ##       ##  #### ######### ##     ## ##          ##        ##
echo ##    ##  ##       ##   ### ##     ## ##     ## ##          ##        ##    ##
echo ##     ## ######## ##    ## ##     ## ##     ## ########    ##         ######    version 0.2



echo.
echo.

set /P oldNamePC="Old PC name : "
set /P newNamePC="New PC name : "

rem Запрос на ввод пароля, скрывает символы
set "psCommand=powershell -Command "$pword = read-host 'Your Password' -AsSecureString ; ^
      $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
            [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set PWD=%%p
::echo %PWD% Проверка вывода пароля

netdom RENAMECOMPUTER %oldNamePC%  /newname: %newNamePC% /userd: %USERNAME% /passwordd: %PWD%

pause
