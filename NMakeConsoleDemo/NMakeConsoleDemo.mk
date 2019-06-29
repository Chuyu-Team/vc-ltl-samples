all: NMakeConsoleDemo.exe

NMakeConsoleDemo.obj: 
  cl.exe  /nologo /TP  /DWIN32 /D_WINDOWS /W3 /GR /EHsc /MT /Zi /O2 /Ob1 /DNDEBUG ..\NMakeConsoleDemo.cpp

NMakeConsoleDemo.exe: NMakeConsoleDemo.obj
  link.exe  /nologo /out:NMakeConsoleDemo.exe /pdb:NMakeConsoleDemo.pdb /subsystem:console kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib NMakeConsoleDemo.obj
