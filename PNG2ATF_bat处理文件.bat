@echo off
@rem
for %%c in (*.png) do (
 ::转换文件夹下边PNG图片为ATF格式
 png2atf -n 0,0 -i %%c -o %%~nc.atf
 ::替换XML文件中的字符串
 :if exist %%~nc.xml (

:	 setlocal enabledelayedexpansion
:	 pushd %1
:	 for /f "tokens=1* delims=:" %%i in ('find /i /n .* "%%~nc.xml"') do (
:	   set str=%%j
:	   echo !str:%%c=%%~nc.atf!>>%1root.tmp
:	 )
:	
:	move /y root.tmp %%~nc.xml
 : )
)




  		
