@echo off

::
::  VC-LTL�Զ����������ã������㽫���ļ��������Ƶ���Ĺ�����ʹ�ã����ļ����Զ�ʶ��ǰ�����Ƿ����VC-LTL�������Զ�Ӧ�á�
::
::  ʹ�÷�����
::    1. ���� vcvars32.bat/vcvars64.bat Ȼ��ִ�д˽ű���������ɺ��Զ��޸�include�Լ�lib��������������nmake�Լ���cl�û�����VC-LTL��
::    2. ��ر�֤���������ľ�̬��Ҳ����VC-LTL���±��롣
::
::  VC-LTLĬ������˳��
::	  1. ��VC-LTL helper for nmake.cmd�����ڸ�Ŀ¼���� %~dp0
::	  2. ��VC-LTL helper for nmake.cmd�����ڸ�Ŀ¼�µ�VC-LTLĿ¼���� %~dp0VC-LTL
::	  3. ��VC-LTL helper for nmake.cmd�����ڸ�Ŀ¼���� %~dp0..
::	  3. ��VC-LTL helper for nmake.cmd�����ڸ�Ŀ¼�µ�VC-LTLĿ¼���� %~dp0..\VC-LTL
::    4. ��ǰĿ¼���� %cd%
::    5. ��ǰĿ¼�µ�VC-LTLĿ¼���� %cd%\VC-LTL
::    6. ��ǰĿ¼�ĸ�Ŀ¼�µ�VC-LTLĿ¼���� %cd%\..\VC-LTL
::    7. ע���HKEY_CURRENT_USER\Code\VC-LTL@Root
::
::  ��VC-LTL��������һ��λ�ü��ɣ�VC-LTL���ܱ��Զ����á�
::
::  ������Ĭ������˳������������޸Ĵ��ļ�����Ҳ����ֱ��ָ��%VC_LTL_Root%���������������Ե�ȥ����VC-LTL��
::




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VC-LTL����::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::ȡ���·�ע�Ϳ��Կ���XP����ģʽ��Ĭ�ϲ���Vista����ģʽ��
::set SupportWinXP=true

::ȡ���·�ע�Ϳ��Կ���VC-LTL����ģʽ������ģʽ����ע��������ƣ�����CRT�淶����ά����VS2008���������Ҫ�߶ȼ���΢��UCRT����ô�벻Ҫ�򿪴�ѡ�����
::set DisableAdvancedSupport=true

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::





if "%VC_LTL_Root%" NEQ "" goto LoadConfig

::����VC-LTLĿ¼

::�ű��ļ���Ŀ¼����VC-LTL��
if exist "%~dp0_msvcrt.h" set VC_LTL_Root=%~dp0&& goto LoadConfig

::�ű��ļ���Ŀ¼�´���VC-LTL��
if exist "%~dp0VC-LTL\_msvcrt.h" set VC_LTL_Root=%~dp0VC-LTL&& goto LoadConfig

::�ű��ļ���Ŀ¼����VC-LTL��
if exist "%~dp0..\_msvcrt.h" set VC_LTL_Root=%~dp0..&& goto LoadConfig

::�ű��ļ���Ŀ¼����VC-LTL��
if exist "%~dp0..\VC-LTL\_msvcrt.h" set VC_LTL_Root=%~dp0..\VC-LTL&& goto LoadConfig

::��ǰ��Ŀ¼����VC-LTL��
if exist "%cd%\_msvcrt.h" set VC_LTL_Root=%cd%&& goto LoadConfig

::��ǰ��Ŀ¼����VC-LTL��
if exist "%cd%\VC-LTL\_msvcrt.h" set VC_LTL_Root=%cd%\VC-LTL&& goto LoadConfig

::��ǰ��Ŀ¼����VC-LTL��
if exist "%cd%\..\VC-LTL\_msvcrt.h" set VC_LTL_Root=%cd%\..\VC-LTL&& goto LoadConfig


::��ȡע��� HKCU\Code\VC-LTL@Root
for /f "tokens=1,2*" %%i in ('reg query "HKCU\Code\VC-LTL" /v Root ') do set VC_LTL_Root=%%k

if "%VC_LTL_Root%" == "" goto:eof


:LoadConfig

call "%VC_LTL_Root%\config\config.cmd"
