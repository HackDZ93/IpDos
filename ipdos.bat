@echo off
title IPDOS.git
cls
:menu
color 0f
echo.
echo                ...:::::..               
echo         .:!????77!!!!!!77????!:.        
echo      .7Y?!:.                .::?Y7.               
echo    .Y5:                          ;PJ    
echo   :B:                              !B:  
echo  ::.                                ::. 
echo  #! .:                            :: 7B 
echo .:. GJ                            !# .:.            [40;35m[ [40;37m1 [40;35m] [40;31mGEOIP [40;37m
echo  ;: 55                            JG .:.            [40;35m[ [40;37m2 [40;35m] [40;31mIP PINGER [40;37m
echo  55 .::                          .:. ?B             [40;35m[ [40;37m3 [40;35m] [40;31mIP SAVER [40;37m
echo  .#: Y5  ::!?JY5!      :5YJ?!::  ?G :#.             [40;35m[ [40;37m4 [40;35m] [40;31mLEAVE [40;37m
echo   .B!PJ B[40;38m@@@@@@@@:    :@@@@@@@@B !B7G.  
echo     J@: #@@@[40;31m@[40;37m@@@G      G@@@[40;31m@[40;37m@@@# .@?    
echo     :B  .B@@@@@?   ..   7@@@@@#.  G7    
echo     !B    :?Y7.  ::55#:  .7Y?:    GJ    
echo      B?         .@@55@@.         7B.    
echo       !5G?7:    :@@JJ@@:    :!?B5!      
echo         .::!:#..        ..B:!::.        
echo          #:!:7!:!:!::!:!--?:-:#         
echo          ::.??!!?-7-!?-7!!??.::         
echo          PY .:!-7:7:!7:7:!:. YP         
echo          .GJ     ......     JG          
echo            7P7:.        .:?P!           
echo              :!?????????7!: 
echo.
echo +===[root@ipdos]
echo +
set /p menu=+==} 
if %menu%==1 goto iplookup
if %menu%==2 goto pinger
if %menu%==3 goto ipsaver
if %menu%==4 goto quit




:quit
echo ...
timeout /t 1 >nul
exit




:ipsaver
color 5
title ipdos.git
cls
set /p NAME5=Enter The Username Of The IP That You Are Saving .:
set /p IP5=Enter The ip That You Are Saving.:
title Saving: %IP% / %NAME%
echo %IP5% / %NAME5% >>IPS.txt 
echo IP Saved Successfuly...
color E
echo PRESS ENTER TO RETURN... 
pause
goto menu

   
:pinger
color 5
cls
echo.
echo                   _
echo                  / /\
echo                 / / /
echo                / / /   _
echo               /_/ /   / /\
echo               \ \ \  / /  \
echo                \ \ \/ / /\ \
echo             _   \ \ \/ /\ \ \
echo           /_/\   \_\  /  \ \ \  
echo           \ \ \  / /  \   \_\/  
echo            \ \ \/ / /\ \ 
echo             \ \ \/ /\ \ \
echo              \ \  /  \ \ \
echo               \_\/   / / /
echo                     / / /
echo                    /_/ /
echo                    \_\/ 
echo.
set /P IP=Enter A IP:
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
:top
PING -n 1 %IP% | FIND "TTL=" >nul
title ~Port9306~~~Pinging:%IP%~~~By:Port9306~
IF ERRORLEVEL 1 (
SET OUT=C
title ~ipdos.git~
<nul set /p="("
call :Port9306 C0 "Host" && <nul set /p="):("
call :Port9306 C0 "%IP%"  && <nul set /p=")~("
call :Port9306 C0 "OFFLINE"  && <nul set /p=")"
echo.
) ELSE (
SET OUT=A
title ~ipdos.git~~I run every skid~Pinging:%IP%~~Neverty7~
<nul set /p="("
call :Port9306 0D "Host" && <nul set /p="):("
call :Port9306 0A "%IP%"  && <nul set /p=")~("
call :Port9306 AC "ONLINE"  && <nul set /p=")"
echo. )
goto :end
:Port9306
<nul set /p "=%DEL%" > "%~2"
findstr /v /a:%1 /R "+" "%~2" nul
del "%~2" > nul
goto :eof
:end
ping -t 1 -l 10 127.0.0.1 >nul
GoTo top
echo.
pause      

:iplookup
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient

del "%temp%\response.txt" /f /q /s >nul
:iplookup
tittle ipdos.git
color 4
cls
echo.
echo        Type an IP to lookup
echo.
set ip=127.0.0.1
set /p ip=IP: 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs
:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
rem echo Msgbox HTTPGET,vbSystemModal+vbOKOnly+vbInformation, "IP Info" >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
cls
echo.
for /f "delims=  " %%i in ('findstr /i "ip hostname city region country loc org postal" %temp%\response.txt') do (
 set data=%%i
 set data=!data:,=!
 set data=!data:""=Not Listed!
 set data=!data:"=!
 set data=!data:ip:=IP:  !
 set data=!data:hostname:=Hostname: !
 set data=!data:city:=City:  !
 set data=!data:region:=State: !
 set data=!data:country:=Country: !
 set data=!data:loc:=Location: !
 set data=!data:org:=ISP:  !
 set data=!data:postal:=Postal: !
 echo !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
if '%ip%'=='' goto menu
goto menu 
cls                       