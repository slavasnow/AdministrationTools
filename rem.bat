@echo off
@echo rename PC

set /P oldNamePC="OLd Name PC: "
set /P newNamePC="New Name PC: "
set /P PWD="Your password: "


netdom RENAMECOMPUTER %oldNamePC%  /newname: %newNamePC% /userd: %USERNAME% /passwordd: %PWD%

pause
