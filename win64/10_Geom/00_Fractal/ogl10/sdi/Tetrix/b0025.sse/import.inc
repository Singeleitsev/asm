  library kernel,'KERNEL32.DLL',\
          user,'USER32.DLL',\
          gdi,'GDI32.DLL',\
          opengl,'OPENGL32.DLL',\
          glu,'GLU32.DLL',\
	  advapi32, 'ADVAPI32.DLL',\
	  ntoskrnl, 'NtosKrnl.exe'

  import kernel,\
         GetModuleHandle,'GetModuleHandleA',\
         GetTickCount,'GetTickCount',\
         ExitProcess,'ExitProcess'

  import user,\
         RegisterClass,'RegisterClassA',\
         MessageBoxA,'MessageBoxA',\
         CreateWindowEx,'CreateWindowExA',\
         DefWindowProc,'DefWindowProcA',\
         GetMessage,'GetMessageA',\
         TranslateMessage,'TranslateMessage',\
         DispatchMessage,'DispatchMessageA',\
         LoadCursor,'LoadCursorA',\
         LoadIcon,'LoadIconA',\
         GetClientRect,'GetClientRect',\
         GetDC,'GetDC',\
         ReleaseDC,'ReleaseDC',\
         PostQuitMessage,'PostQuitMessage'
  

  import gdi,\
         ChoosePixelFormat,'ChoosePixelFormat',\
         SetPixelFormat,'SetPixelFormat',\
         SwapBuffers,'SwapBuffers'

import opengl,\
glBegin,'glBegin',\
glClear,'glClear',\
glColor3f,'glColor3f',\
glEnd,'glEnd',\
glRotatef,'glRotatef',\
glVertex3f,'glVertex3f',\
glViewport,'glViewport',\
wglCreateContext,'wglCreateContext',\
wglDeleteContext,'wglDeleteContext',\
wglMakeCurrent,'wglMakeCurrent'

;import glu,\


import advapi32,\
         CryptAcquireContext,'CryptAcquireContextA',\
         CryptGenRandom,'CryptGenRandom',\
         CryptReleaseContext,'CryptReleaseContext'

  import ntoskrnl,\
	 RtlRandomEx,'RtlRandomEx'


