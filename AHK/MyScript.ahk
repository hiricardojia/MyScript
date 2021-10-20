;-----------remapping key-------------
;CapsLock::Ctrl

>^j::Send {Down}
>^k::Send {Up}
>^H::Send {Left}
>^L::Send {Right}
Ctrl & Enter::Send {End}
~LShift & Enter::
    Send {End}
    Send {Enter}
return
;-------inputmethod switch------------

~Esc::SwitchIME(04090409)
~RShift::SwitchIME(00000804)

RCtrl::
    Send {Esc}
    SwitchIME(04090409)
return

; ~RCtrl:: 
;     if (A_PriorHotkey <> "~RCtrl" or A_TimeSincePriorHotkey > 400) 
;     { 
;         ; Too much time between presses, so this isn't a double-press.  
;         KeyWait, Esc 
;         return 
;     } 
;     Send {Esc}
;     SwitchIME(04090409)
; return


SwitchIME(dwLayout){
    HKL:=DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1)
    ControlGetFocus,ctl,A
    SendMessage,0x50,0,HKL,%ctl%,A
}

;-------wheel control sound-------
~WheelUp::
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send,{Volume_Up}
Return
~WheelDown::
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send,{Volume_Down}
Return
~MButton::
    if (existclass("ahk_class Shell_TrayWnd")=1)
        Send,{Volume_Mute}
Return

Existclass(class)
{
    MouseGetPos,,,win
    WinGet,winid,id,%class%
    if win = %winid%
        Return,1
    Else
        Return,0
}
