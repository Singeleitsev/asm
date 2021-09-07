.const
cb1 					equ	1303
rb1 					equ 1306
rb2 					equ 1307
rb3 					equ 1308
IDC_FONTBTN 			equ	2013
IDC_EDIT3 				equ 7001
IDC_BUTTONAPPLY 		equ	7002
IDC_CANCEL 		 		equ	7003
IDC_BUTTONCLOSE 		equ	2018
futbutton  				equ	2025
IDC_RADIOBUTTONLEFT  	equ	2020
IDC_RADIOBUTTONCENTER  	equ	2021
IDC_RADIOBUTTONRIGHT  	equ	2022
IDC_CHECKBOXTIME  		equ	2024


cb2   					equ	1313
rb4   					equ	1316
rb5   					equ	1317
rb6   					equ	1318
IDC_FONTBTN1   			equ	2033
IDC_EDIT4  				equ	7004
IDC_BUTTONAPPLY1   		equ	7005
IDC_CANCEL1   			equ	7006
IDC_BUTTONCLOSE1   		equ	2038
headbutton   			equ	2040
IDC_FRADIOBUTTONLEFT   	equ	2042
IDC_FRADIOBUTTONCENTER  equ	2043
IDC_FRADIOBUTTONRIGHT   equ	2044
IDC_CHECKBOXTIME1   	equ	2045


.code


ResetButtos proc hCtl:DWORD,rbtn:DWORD,cbtn:DWORD

			
				invoke SetDlgItemText,hCtl, cbtn,0
				invoke GetDlgItem, hCtl, cbtn
    			invoke EnableWindow,eax,FALSE
    			inc cbtn
    			invoke GetDlgItem, hCtl, cbtn
				invoke EnableWindow,eax,TRUE
				inc cbtn
				invoke GetDlgItem, hCtl, cbtn
				invoke EnableWindow,eax,TRUE
    			invoke CheckDlgButton,hCtl,rbtn,BST_UNCHECKED
    			inc rbtn	
				invoke CheckDlgButton,hCtl,rbtn,BST_UNCHECKED
				inc rbtn
				invoke CheckDlgButton,hCtl,rbtn,BST_UNCHECKED
	ret
ResetButtos endp
ResetAlignButtons proc hCtl:DWORD,rbtn:DWORD,cbtn:DWORD

				invoke GetDlgItem, hCtl, cbtn
				invoke EnableWindow,eax,TRUE
				inc cbtn
				invoke GetDlgItem, hCtl, cbtn
				invoke EnableWindow,eax,TRUE
				invoke CheckDlgButton,hCtl,rbtn,BST_UNCHECKED
				inc rbtn
				invoke CheckDlgButton,hCtl,rbtn,BST_UNCHECKED
				inc rbtn
				invoke CheckDlgButton,hCtl,rbtn,BST_UNCHECKED

	ret
ResetAlignButtons endp

TogleHeaderButtos proc hCtl:DWORD,state:DWORD
	invoke GetDlgItem, hCtl,cb1
	invoke CheckDlgButton,hCtl,eax,state
	invoke GetDlgItem, hCtl, IDC_BUTTONAPPLY
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_RADIOBUTTONLEFT
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_RADIOBUTTONCENTER
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_RADIOBUTTONCENTER
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, rb1
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, rb2
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, rb3
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_FONTBTN
	invoke EnableWindow,eax,state				
	invoke GetDlgItem, hCtl, IDC_CHECKBOXTIME
	invoke EnableWindow,eax,state
	ret
TogleHeaderButtos endp
TogleFooterButtos proc hCtl:DWORD,state:DWORD
	invoke GetDlgItem, hCtl,cb2
	invoke CheckDlgButton,hCtl,eax,state
	invoke GetDlgItem, hCtl, IDC_BUTTONAPPLY1
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_FRADIOBUTTONLEFT
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_FRADIOBUTTONCENTER
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_FRADIOBUTTONCENTER
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, rb4
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, rb5
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, rb6
	invoke EnableWindow,eax,state
	invoke GetDlgItem, hCtl, IDC_FONTBTN1
	invoke EnableWindow,eax,state				
	invoke GetDlgItem, hCtl, IDC_CHECKBOXTIME1
	invoke EnableWindow,eax,state
	ret
TogleFooterButtos endp

HeaderDlgProc proc hHeaddlg:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
local   tl	  		:DWORD
	
	mov		eax,uMsg
	.if eax==WM_INITDIALOG
	  invoke     GetSystemMetrics, SM_CXSCREEN
         sub     eax, 294
         shr     eax, 1
        push     eax
      invoke     GetSystemMetrics, SM_CYSCREEN
         sub     eax, 270
         shr     eax, 1
         pop     edx
      invoke  	 MoveWindow,hHeaddlg,edx,eax,294,270,TRUE

		.if lParam
			mov		eax,BN_CLICKED
			shl		eax,16
			invoke PostMessage,hHeaddlg,WM_COMMAND,eax,0
		.endif
	    .if PrtHead 
	    	invoke CheckDlgButton,hHeaddlg,cb1,BST_CHECKED
	    .else
	    	invoke CheckDlgButton,hHeaddlg,cb1,BST_UNCHECKED
	    .endif    
		.if PrtName == 1
			invoke CheckDlgButton,hHeaddlg,rb1,BST_CHECKED
		.else
			invoke CheckDlgButton,hHeaddlg,rb1,BST_UNCHECKED
		.endif
		.if PrtPath ==1
			invoke CheckDlgButton,hHeaddlg,rb2,BST_CHECKED
		.else
			invoke CheckDlgButton,hHeaddlg,rb2,BST_UNCHECKED
		.endif		
		.if PrtLeft ==1
			invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONLEFT,BST_CHECKED
		.else
			invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONLEFT,BST_UNCHECKED
		.endif		
		.if PrtCenter ==1
			invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONCENTER,BST_CHECKED
		.else
			invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONCENTER,BST_UNCHECKED
		.endif		
		.if PrtRight ==1
			invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONRIGHT,BST_CHECKED
		.else
			invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONRIGHT,BST_UNCHECKED
		.endif		
		.if PrtTime ==1
			invoke CheckDlgButton,hHeaddlg,IDC_CHECKBOXTIME,BST_CHECKED
		.else
			invoke CheckDlgButton,hHeaddlg,IDC_CHECKBOXTIME,BST_UNCHECKED
		.endif		
		.if PrtText==1		
			invoke CheckDlgButton,hHeaddlg,rb3,BST_CHECKED
			invoke     GetDlgItem, hHeaddlg, IDC_EDIT3
			push eax
			invoke EnableWindow,eax,TRUE
			pop eax
    		invoke     SetFocus, eax
		.else
			invoke     GetDlgItem, hHeaddlg, rb3		
			invoke CheckDlgButton,hHeaddlg,eax,BST_UNCHECKED
			invoke     GetDlgItem, hHeaddlg, IDC_EDIT3
  			invoke EnableWindow,eax,FALSE
		.endif		
	.elseif eax==WM_COMMAND
		mov		eax,wParam
		mov		edx,eax
		shr		edx,16
		and		eax,0FFFFh
		.if edx==BN_CLICKED
			.if eax==IDC_BUTTONAPPLY
				invoke IsDlgButtonChecked,hHeaddlg,cb1
				.if eax
					mov   PrtHead,1
					invoke IsDlgButtonChecked,hHeaddlg,rb3
					.if eax 
					 mov PrtText,1
					 invoke     GetDlgItemText, hHeaddlg, IDC_EDIT3, offset szPrtHeadBuff, lengthof szPrtHeadBuff
					.else
						mov PrtText,0
					.endif
					invoke IsDlgButtonChecked,hHeaddlg,rb1
					.if eax
						mov PrtName,1
					.else
						mov PrtName,0
					.endif
					invoke IsDlgButtonChecked,hHeaddlg,rb2
					.if eax
						mov   PrtPath,1
					.else
						mov   PrtPath,0
					.endif
					invoke IsDlgButtonChecked,hHeaddlg,IDC_RADIOBUTTONLEFT
					.if eax
						mov PrtLeft,1
					.else
						mov PrtLeft,0 
					.endif
					invoke IsDlgButtonChecked,hHeaddlg,IDC_RADIOBUTTONRIGHT
					.if eax
						mov PrtRight,1
					.else
						mov PrtRight,0 
					.endif
					invoke IsDlgButtonChecked,hHeaddlg,IDC_RADIOBUTTONCENTER
					.if eax
						mov PrtCenter,1
					.else
						mov PrtCenter,0 
					.endif
					invoke IsDlgButtonChecked,hHeaddlg,IDC_CHECKBOXTIME
					.if eax
						mov PrtTime,1
					.else
						mov PrtTime,0  
					.endif
					invoke GetDlgItem, hHeaddlg, IDC_BUTTONAPPLY
					invoke EnableWindow,eax,FALSE
					invoke GetDlgItem, hHeaddlg, IDC_CANCEL
					invoke EnableWindow,eax,FALSE
				.else
					mov   PrtHead,0
				.endif
			.elseif eax==IDC_BUTTONCLOSE
				invoke SendMessage,hHeaddlg,WM_CLOSE,NULL,NULL
			.elseif eax== futbutton
				invoke SendMessage,hHeaddlg,WM_CLOSE,NULL,NULL
				invoke DialogBoxParam,hInstance,IDD_PRTFOOT,hWndMain,offset FooterDlgProc,FALSE
			.elseif eax==IDC_CANCEL
				invoke SendMessage,hHeaddlg,WM_CLOSE,NULL,NULL
			.elseif eax==rb1
				invoke ResetButtos,hHeaddlg,rb1,IDC_EDIT3
    			invoke CheckDlgButton,hHeaddlg,rb1,BST_CHECKED	
			.elseif eax==rb2
				invoke ResetButtos,hHeaddlg,rb1,IDC_EDIT3
				invoke CheckDlgButton,hHeaddlg,rb2,BST_CHECKED
			.elseif eax==rb3
				invoke ResetButtos,hHeaddlg,rb1,IDC_EDIT3
				invoke CheckDlgButton,hHeaddlg,rb3,BST_CHECKED
				invoke GetDlgItem, hHeaddlg, IDC_EDIT3
    			push eax
    			invoke EnableWindow,eax,TRUE
    			pop eax
    			invoke SetFocus,eax		
			.elseif eax==IDC_RADIOBUTTONLEFT
				invoke ResetAlignButtons,hHeaddlg,IDC_RADIOBUTTONLEFT,IDC_BUTTONAPPLY
				invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONLEFT,BST_CHECKED
			.elseif eax==IDC_RADIOBUTTONCENTER
				invoke ResetAlignButtons,hHeaddlg,IDC_RADIOBUTTONLEFT,IDC_BUTTONAPPLY
				invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONCENTER,BST_CHECKED
			.elseif eax==IDC_RADIOBUTTONRIGHT
				invoke ResetAlignButtons,hHeaddlg,IDC_RADIOBUTTONLEFT,IDC_BUTTONAPPLY
				invoke CheckDlgButton,hHeaddlg,IDC_RADIOBUTTONRIGHT,BST_CHECKED
			.elseif eax==cb1
				invoke IsDlgButtonChecked,hHeaddlg,cb1
				.if !eax
					mov PrtHead,FALSE
					invoke TogleHeaderButtos,hHeaddlg,FALSE
					invoke IsDlgButtonChecked,hHeaddlg,rb3
					.if eax
					    invoke GetDlgItem, hHeaddlg, IDC_EDIT3
    					push eax    					  					
						invoke SetDlgItemText,hHeaddlg, IDC_EDIT3,0
						pop eax 
		    			invoke EnableWindow,eax,FALSE
					.endif
				.else
					mov PrtHead,TRUE
					invoke TogleHeaderButtos,hHeaddlg,TRUE
					invoke IsDlgButtonChecked,hHeaddlg,rb3
					.if eax
						invoke GetDlgItem, hHeaddlg, IDC_EDIT3
						push eax
    					invoke EnableWindow,eax,TRUE
    					pop eax
    					invoke SetFocus,eax	
    				.endif				
				.endif
			.elseif eax==IDC_FONTBTN
				invoke	HeadFont,hHeaddlg
					invoke IsDlgButtonChecked,hHeaddlg,rb3
					.if eax
						invoke GetDlgItem, hHeaddlg, IDC_EDIT3
						push eax
    					invoke EnableWindow,eax,TRUE
    					pop eax
    					invoke SetFocus,eax						
    				.endif				
			.elseif eax==IDC_CHECKBOXTIME
				invoke GetDlgItem, hHeaddlg, IDC_BUTTONAPPLY
				invoke EnableWindow,eax,TRUE
				invoke GetDlgItem, hHeaddlg, IDC_CANCEL
				invoke EnableWindow,eax,TRUE
				invoke IsDlgButtonChecked,hHeaddlg,IDC_CHECKBOXTIME
				.if !eax
					invoke CheckDlgButton,hHeaddlg,IDC_CHECKBOXTIME,BST_UNCHECKED
				.else
					invoke CheckDlgButton,hHeaddlg,IDC_CHECKBOXTIME,BST_CHECKED
				.endif									
			.else			
			.endif
		.endif
	.elseif eax==WM_CLOSE
		invoke     EndDialog, hHeaddlg, wParam
		invoke DestroyWindow,hHeaddlg
	.else
		mov eax,FALSE
		ret
	.endif
		mov  eax,TRUE
	ret
HeaderDlgProc endp



FooterDlgProc proc hFootdlg:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM

	
	mov		eax,uMsg
	.if eax==WM_INITDIALOG
	  invoke     GetSystemMetrics, SM_CXSCREEN
         sub     eax, 294
         shr     eax, 1
        push     eax
      invoke     GetSystemMetrics, SM_CYSCREEN
         sub     eax, 270
         shr     eax, 1
         pop     edx
      invoke  	 MoveWindow,hFootdlg,edx,eax,294,270,TRUE

		.if lParam
			mov		eax,BN_CLICKED
			shl		eax,16
			invoke PostMessage,hFootdlg,WM_COMMAND,eax,0
		.endif
	    .if PrtFoot 
	    	invoke CheckDlgButton,hFootdlg,cb2,BST_CHECKED
	    .else
	    	invoke CheckDlgButton,hFootdlg,cb2,BST_UNCHECKED
	    .endif    
		.if FootNums == 1
			invoke CheckDlgButton,hFootdlg,rb4,BST_CHECKED
		.else
			invoke CheckDlgButton,hFootdlg,rb4,BST_UNCHECKED
		.endif
		.if FootPage ==1
			invoke CheckDlgButton,hFootdlg,rb5,BST_CHECKED
		.else
			invoke CheckDlgButton,hFootdlg,rb5,BST_UNCHECKED
		.endif		
		.if FootLeft ==1
			invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONLEFT,BST_CHECKED
		.else
			invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONLEFT,BST_UNCHECKED
		.endif		
		.if FootCenter ==1
			invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONCENTER,BST_CHECKED
		.else
			invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONCENTER,BST_UNCHECKED
		.endif		
		.if FootRight ==1
			invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONRIGHT,BST_CHECKED
		.else
			invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONRIGHT,BST_UNCHECKED
		.endif		
		.if FootTime ==1
			invoke CheckDlgButton,hFootdlg,IDC_CHECKBOXTIME1,BST_CHECKED
		.else
			invoke CheckDlgButton,hFootdlg,IDC_CHECKBOXTIME1,BST_UNCHECKED
		.endif		
		.if FootText==1		
			invoke CheckDlgButton,hFootdlg,rb6,BST_CHECKED
			invoke     GetDlgItem, hFootdlg, IDC_EDIT4
			push eax
			invoke EnableWindow,eax,TRUE
			pop eax
    		invoke     SetFocus, eax
		.else
			invoke GetDlgItem, hFootdlg, rb6		
			invoke CheckDlgButton,hFootdlg,eax,BST_UNCHECKED
			invoke GetDlgItem, hFootdlg, IDC_EDIT4
  			invoke EnableWindow,eax,FALSE
		.endif		
	.elseif eax==WM_COMMAND
		mov		eax,wParam
		mov		edx,eax
		shr		edx,16
		and		eax,0FFFFh
		.if edx==BN_CLICKED
			.if eax==IDC_BUTTONAPPLY1
				invoke IsDlgButtonChecked,hFootdlg,cb2
				.if eax
					mov   PrtFoot,1
					invoke IsDlgButtonChecked,hFootdlg,rb6
					.if eax 
					 mov FootText,1
					 invoke     GetDlgItemText, hFootdlg, IDC_EDIT4, offset szPrtFootBuff, lengthof szPrtFootBuff
					.else
						mov FootText,0
					.endif
					invoke IsDlgButtonChecked,hFootdlg,rb4
					.if eax
						mov FootNums,1
					.else
						mov FootNums,0
					.endif
					invoke IsDlgButtonChecked,hFootdlg,rb5
					.if eax
						mov   FootPage,1
					.else
						mov   FootPage,0
					.endif
					invoke IsDlgButtonChecked,hFootdlg,IDC_FRADIOBUTTONLEFT
					.if eax
						mov FootLeft,1
					.else
						mov FootLeft,0 
					.endif
					invoke IsDlgButtonChecked,hFootdlg,IDC_FRADIOBUTTONRIGHT
					.if eax
						mov FootRight,1
					.else
						mov FootRight,0 
					.endif
					invoke IsDlgButtonChecked,hFootdlg,IDC_FRADIOBUTTONCENTER
					.if eax
						mov FootCenter,1
					.else
						mov FootCenter,0 
					.endif
					invoke IsDlgButtonChecked,hFootdlg,IDC_CHECKBOXTIME1
					.if eax
						mov FootTime,1
					.else
						mov FootTime,0  
					.endif
					invoke GetDlgItem, hFootdlg, IDC_BUTTONAPPLY1
					invoke EnableWindow,eax,FALSE
					invoke GetDlgItem, hFootdlg, IDC_CANCEL1
					invoke EnableWindow,eax,FALSE
				.else
					mov   PrtFoot,0
				.endif
			.elseif eax==IDC_BUTTONCLOSE1
				invoke SendMessage,hFootdlg,WM_CLOSE,NULL,NULL
			.elseif eax== headbutton
				invoke SendMessage,hFootdlg,WM_CLOSE,NULL,NULL
				invoke DialogBoxParam,hInstance,IDD_PRTHEAD,hWndMain,offset HeaderDlgProc,FALSE
			.elseif eax==IDC_CANCEL1
				invoke SendMessage,hFootdlg,WM_CLOSE,NULL,NULL
			.elseif eax==rb4
				invoke ResetButtos,hFootdlg,rb4,IDC_EDIT4
    			invoke CheckDlgButton,hFootdlg,rb4,BST_CHECKED	
			.elseif eax==rb5
				invoke ResetButtos,hFootdlg,rb4,IDC_EDIT4
				invoke CheckDlgButton,hFootdlg,rb5,BST_CHECKED
			.elseif eax==rb6
				invoke ResetButtos,hFootdlg,rb4,IDC_EDIT4
				invoke CheckDlgButton,hFootdlg,rb6,BST_CHECKED
				invoke GetDlgItem, hFootdlg, IDC_EDIT4
    			push eax
    			invoke EnableWindow,eax,TRUE
    			pop eax
    			invoke SetFocus,eax		
			.elseif eax==IDC_FRADIOBUTTONLEFT
				invoke ResetAlignButtons,hFootdlg,IDC_FRADIOBUTTONLEFT,IDC_BUTTONAPPLY1
				invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONLEFT,BST_CHECKED
			.elseif eax==IDC_FRADIOBUTTONCENTER
				invoke ResetAlignButtons,hFootdlg,IDC_FRADIOBUTTONLEFT,IDC_BUTTONAPPLY1
				invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONCENTER,BST_CHECKED
			.elseif eax==IDC_FRADIOBUTTONRIGHT
				invoke ResetAlignButtons,hFootdlg,IDC_FRADIOBUTTONLEFT,IDC_BUTTONAPPLY1
				invoke CheckDlgButton,hFootdlg,IDC_FRADIOBUTTONRIGHT,BST_CHECKED
			.elseif eax==cb2
				invoke IsDlgButtonChecked,hFootdlg,cb2
				.if !eax
					mov PrtFoot,FALSE
					invoke TogleFooterButtos,hFootdlg,FALSE
					invoke IsDlgButtonChecked,hFootdlg,rb6
					.if eax
					    invoke GetDlgItem, hFootdlg, IDC_EDIT4
    					push eax    					  					
						invoke SetDlgItemText,hFootdlg, IDC_EDIT4,0
						pop eax 
		    			invoke EnableWindow,eax,FALSE
					.endif
				.else
					mov PrtFoot,TRUE
					invoke TogleFooterButtos,hFootdlg,TRUE
					invoke IsDlgButtonChecked,hFootdlg,rb6
					.if eax
						invoke GetDlgItem, hFootdlg, IDC_EDIT4
						push eax
    					invoke EnableWindow,eax,TRUE
    					pop eax
    					invoke SetFocus,eax	
    				.endif				
				.endif
			.elseif eax==IDC_FONTBTN1
				invoke	FootFont,hFootdlg
					invoke IsDlgButtonChecked,hFootdlg,rb6
					.if eax
						invoke GetDlgItem, hFootdlg, IDC_EDIT4
						push eax
    					invoke EnableWindow,eax,TRUE
    					pop eax
    					invoke SetFocus,eax						
    				.endif				
			.elseif eax==IDC_CHECKBOXTIME1
				invoke GetDlgItem, hFootdlg, IDC_BUTTONAPPLY1
				invoke EnableWindow,eax,TRUE
				invoke GetDlgItem, hFootdlg, IDC_CANCEL1
				invoke EnableWindow,eax,TRUE
				invoke IsDlgButtonChecked,hFootdlg,IDC_CHECKBOXTIME1
				.if !eax
					invoke CheckDlgButton,hFootdlg,IDC_CHECKBOXTIME1,BST_UNCHECKED
				.else
					invoke CheckDlgButton,hFootdlg,IDC_CHECKBOXTIME1,BST_CHECKED
				.endif									
			.else			
			.endif
		.endif
	.elseif eax==WM_CLOSE
		invoke     EndDialog, hFootdlg, wParam
		invoke DestroyWindow,hFootdlg
	.else
		mov eax,FALSE
		ret
	.endif
		mov  eax,TRUE
	ret
FooterDlgProc endp

