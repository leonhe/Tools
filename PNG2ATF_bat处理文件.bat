@echo off
@rem
for %%c in (*.png) do (
 ::ת���ļ����±�PNGͼƬΪATF��ʽ
 png2atf -n 0,0 -i %%c -o %%~nc.atf
 ::�滻XML�ļ��е��ַ���
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




  		
