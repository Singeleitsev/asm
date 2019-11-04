             page      63,132
             .286
             title     fdread - lesen von disketten aller formate

cseg         segment   word public 'device_dvr'
             assume    cs:cseg

             org       0
             dd        -1                                  ;Nur ein Driver
             dw        1000000000000000b                   ;Character-Device
stra         dw        strategy                            ;Strategy-Routine
entr         dw        entry                               ;Einsprungadresse
             db        '&FDREAD2'                          ;Dummy-Name

error        proc      far
             mov       word ptr es:[bx+3],8103h            ;Fehler, da nur Dummy-Device
             retf                                          ;Ende
error        endp

old13        label     dword                               ;Speicherung des alten Interrupt 13
old13_ofs    dw        ?                                   ;Offset-Teil
old13_seg    dw        ?                                   ;Segment-Teil
oldsec       db        ?

en           proc      far
             push      ax                                  ;AX retten
             or        ah,ah                               ;Wurde Funktion 0 RESET aufgerufen?
             jz        donothing                           ;Ja, dann Ende
             cmp       ah,4                                ;Wurde Funktion Åber 4 aufgerufen?
             ja        donothing                           ;Ja, dann Ende
             cmp       dl,3
             ja        donothing
             push      bx                                  ;...Register...
             push      ds                                  ;...retten
             push      0
             pop       ds
             lds       bx,ds:[78h]                         ;Disk-Parameter Tabelle in DS:BX
             mov       al,ds:[bx+4]
oldsec1:     mov       oldsec,al
             mov       byte ptr ds:[bx+4],1Bh              ;Setze auf maximal 25 Sektoren/Spur
             or        ch,ch                               ;Track 0 ?
             jz        exit                                ;Ja, dann Ende
             pop       ds                                  ;Alle...
             pop       bx                                  ;...Register...
             pop       ax                                  ;...zurÅckholen.
             push      ax                                  ;AX fÅr spÑter speichern
             pushf                                         ;Flags pushen da INT-CALL
callpatch:   call      old13                               ;Alten INT 13 aufrufen
             jnc       okexit                              ;Kein Fehler, dann Ende
             pop       ax                                  ;Hole uns AX zurÅck
             push      ds                                  ;Speichere...
             push      bx                                  ;...DS & BX
             push      40h                                 ;BIOS-Data Segment...
             pop       ds                                  ;...nach DS
             mov       bx,90h                              ;Beginn der Drive-Tabelle
             add       bl,dl                               ;Offset des Laufwerks
             cmp       ch,43                               ;Track>43
             ja        nodstep                             ;Ja, dann niemals DSTEP
             xor       byte ptr ds:[bx],20h                ;invertiere das Stepper-Bit
             jmp       short stepend                       ;Ende vom Stepping
nodstep:     and       byte ptr ds:[bx],0dfh               ;Kein Double-Stepping
stepend:     pop       bx                                  ;Hole BX und..
             pop       ds                                  ;...DS zurÅck
             jmp       short endrout2                      ;Routine zu Ende
exit:        pop       ds                                  ;Hole alle benutzten...
             pop       bx                                  ;...Register...
             pop       ax                                  ;...wieder zurÅck
endrout2:    pushf
endrout:     call      old13                               ;Springe an den alten Interrupt 13
             push      ax
okexit:      push      ax
             push      bx
             push      ds
             push      0
             pop       ds
             lds       bx,ds:[78h]                         ;Disk-Parameter Tabelle in DS:BX
oldsec2:     mov       al,oldsec
             mov       ds:[bx+4],al
             pop       ds
             pop       bx
             pop       ax

             inc       sp                                  ;Werfe den...
             inc       sp                                  ;...gesicherten AX weg
             ret       2                                   ;Und Ende mit original Flags

donothing:   pop       ax
callpatch2:  jmp       old13

en           endp

savreq       label     dword                               ;DWORD zur...
savreq_o     dw        ?                                   ;...Sicherung des...
savreq_s     dw        ?                                   ;...Request Headers

strategy     proc      far                                 ;Strategy-Routine
             mov       cs:[savreq_o],bx                    ;BX speichern
             mov       cs:[savreq_s],es                    ;ES speichern
             ret                                           ;...Fertig
strategy     endp

entry        proc      far                                 ;Einsprung Routine des Drivers
             assume    cs:cseg
             push      ax                                  ;Alle Register und Flags retten
             push      cx
             push      dx
             push      di
             push      si
             push      ds
             push      es
             push      bx
             pushf
             les       bx,cs:[savreq]                      ;Hole den Request-Header
             mov       al,es:[bx+2]                        ;Lade die Funktion
             cmp       al,0                                ;grî·er als 0
             jnz       unkwn_com                           ;Ja, Fehler
             jmp       short init                          ;Sonst initialisiere den Treiber
entry        endp

rout         proc      far
exit1:       mov       ax,100h                             ;Return ohne Fehler
             jmp       short exgem
unkwn_com:   mov       ax,8103h                            ;Unbekannter Befehl
exgem:       mov       es:[bx+3],ax
             popf                                          ;Alle Register wiederherstellen
             pop       bx
             pop       es
             pop       ds
             pop       si
             pop       di
             pop       dx
             pop       cx
             pop       ax
             ret
rout         endp                                          ;und zurÅckgehen


;Die folgende Routine installiert FDREAD als Device-Driver bei Einbindung
;in CONFIG.SYS mit dem DEVICE= Befehl

init:        mov       dx,offset text                      ;Lade BegrÅ·ungstext
             mov       ah,9                                ;AH=9 fÅr...
             int       21h                                 ;...Ausgabe auf Bildschirm
             call      MachineCheck                        ;Teste CPU
             cmp       ax,2                                ;Ist es mindestens 286?
             jae       pok2                                ;Ja, dann ok
             mov       ah,9                                ;Textausgabe
             mov       dx,offset t286                      ;Fehlertext
             int       21h                                 ;Und auf Bildschirm
             mov       word ptr es:[bx+14],0               ;Nichts resident machen
             jmp       unkwn_com                           ;Mit Fehler beenden
pok2:        mov       word ptr es:[bx+14],offset savreq   ;Bis hier resident machen
             mov       es:[bx+16],cs                       ;Segment auch abspeichern
             xor       ax,ax                               ;AX auf Null setzen
             push      ax                                  ;Brauchen wir gleich nochmal
             mov       ds,ax                               ;und DS=0 fÅr Interrupt-Tabelle
             lds       ax,ds:[13h*4]                       ;Lade alten Interrupt 13 in DS:BX
             mov       cs:[old13_ofs],ax                   ;und speichere...
             mov       cs:[old13_seg],ds                   ;...es ab.
             pop       ds                                  ;Nochmal DS=0
             mov       word ptr ds:[13h*4],offset en       ;Setze Offset von neuem INT 13
             mov       ds:[13h*4+2],cs                     ;Setze Segment von neuem INT 13
             mov       word ptr cs:[stra],offset error     ;Alle Device-Driver-Requests...
             mov       word ptr cs:[entr],offset error     ;...mit UNKNOWN COMMAND beantowrten.
             jmp       exit1                               ;und schon fertig.

text         db        'FDREAD286 - Ver 1.31 - Written by: C.HochstÑtter, J.Armengaud & P.Summers',10,10,13,"$"
t286         db        'This program requires at least an 80286 processor.',10,13,"$"
             include   cputest.asm

;Die folgende Routine installiert FDREAD bei Aufruf von der DOS-Kommandozeile.
;HINWEIS: Diese Installation ist nicht mîglich unter OS/2


xms          label     dword
xms_ofs      dw        ?
xms_seg      dw        ?
umbok        dw        3100h
lex          equ       offset savreq-offset old13

exeinst:     xor       ax,ax                               ;AX=0
             mov       word ptr cs:[callpatch+3],ax        ;Relativer JUMP ist 0
             mov       word ptr cs:[endrout+3],ax          ;Ok, nicht besonders elegant
             mov       word ptr cs:[callpatch2+3],ax
             mov       ax,4
             mov       word ptr cs:[oldsec1+2],ax
             mov       word ptr cs:[oldsec2+2],ax
             mov       ah,51h                              ;Hole den PSP...
             int       21h                                 ;...in BX
             push      bx                                  ;Speichern...
             push      bx                                  ;2 x
             pop       ds                                  ;...in DS
             mov       es,ds:[2ch]                         ;Environment in ES holen
             mov       ah,49h                              ;AH=49, um Environment
             int       21h                                 ;freizugeben
             pop       es                                  ;PSP wieder in ES
             push      cs                                  ;DS mit Programm
             pop       ds                                  ;Segment laden
             mov       dx,offset text                      ;BegrÅ·ungstext laden
             mov       ah,9                                ;Und Åber INT 21...
             int       21h                                 ;...auf Bildschirm ausgeben
             call      MachineCheck                        ;PrÅfe CPU
             cmp       ax,2                                ;Ist es 286 oder mehr?
             jae       pok                                 ;Ja, Processor ok
             mov       dx,offset t286                      ;Sonst Text in DX
             mov       ah,9                                ;Fehlermeldung...
             int       21h                                 ;...ausgeben
             mov       ax,4c01h                            ;Return-Code 1
             int       21h                                 ;Ende
pok:         mov       ax,cs                               ;Sind wir...
             cmp       ax,0a000h                           ;...high-geloaded?
             jae       noumb                               ;Ja, dann kein UMB requesten
             mov       ax,4300h                            ;Mal sehen,...
             int       2fh                                 ;...,ob ein XMS-Treiber da ist?
             cmp       al,80h                              ;Nein?
             jnz       noumb                               ;Dann kein UMB requesten
             push      es                                  ;Sichere ES
             mov       ax,4310h                            ;Ansonsten...
             int       2fh                                 ;...holen wir uns die...
             mov       xms_ofs,bx                          ;...Far-Call-Adresse (Bloede Erfindung)...
             mov       xms_seg,es                          ;...und speichern sie ab
             pop       es                                  ;ES restaurieren
             mov       dx,(lex+15)/16                      ;Anzahl der benîtigten Bytes
             push      dx                                  ;Merke die benîtigten Paragraphen
             mov       ah,10h                              ;XMS-Call 10 (Request-UMB)
             call      xms                                 ;Rufe XMS-Driver
             pop       cx                                  ;Benîtigte Paragraphen in CX
             cmp       ax,1                                ;Ist was schiefgelaufen?
             jnz       noumb                               ;Ja, dann machen wirs ohne UMB
             cmp       dx,cx                               ;Vergleiche benîtigte und erhaltene Paragraphen
             jae       notsmall                            ;UMB-Block zu klein?
             mov       dx,bx                               ;Ok, war zu klein
             mov       ah,11h                              ;Dann werfen wir ihn wieder weg
             call      xms                                 ;Aufrufen
             jmp       short noumb                         ;Und ohne UMB installieren

notsmall:    push      bx                                  ;UMB-Segment in...
             pop       es                                  ;...ES speichern (destination)
             push      cs                                  ;Source-Segment...
             pop       ds                                  ;...in DS speichern
             mov       si,offset old13                     ;Offset beginnt hier
             xor       di,di                               ;Destination Offset ist 0
             cld                                           ;hochzaehlen
             mov       cx,lex                              ;Anzahl der Bytes
             rep       movsb                               ;und moven
             mov       cs:umbok,4c00h                      ;Merke, dass mit UMB installiert wurde
             push      bx                                  ;UMB-Segment...
             pop       ds                                  ;...nach DS
             jmp       short make_resi                     ;Und mache resident


noumb:       mov       di,60h                             ;Hier kînnen wir die Routine laden
             mov       si,offset old13                    ;Und zwar ab hier
             mov       cx,offset strategy-offset old13    ;mit dieser LÑnge
             rep       movsb                              ;Ok, verschiebe den Code
             mov       ax,es                              ;Nun DS auf neues...
             add       ax,6                               ;...Segment...
             mov       ds,ax                              ;...setzen.
make_resi:   mov       ax,3513h                           ;Lade die alte INT 13 Routine
             int       21h                                ;Åber DOS Call
             mov       ds:[0],bx                          ;Speichere die Werte ab
             mov       ds:[2],es                          ;Segment und Offset
             mov       dx,5                               ;Beginn der Service-Routine
             mov       ax,2513h                           ;öber DOS-Call
             int       21h                                ;installieren
             mov       ax,cs:umbok                        ;Wir bleiben speicherresident
             mov       dx,(lex/16)+7                      ;Anzahl der benîtigten Paragraphen
             int       21h                                ;Und Ende

cseg         ends

sseg         segment   stack
             dw        256 dup(?)
sseg         ends

             end       exeinst
