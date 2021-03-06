;----------------------------------------------------------------------

;----------------------------------------------------------------------
; If the script is not elevated, relaunch as administrator and kill current instance:
;~ full_command_line := DllCall("GetCommandLine", "str")
;~ if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
;~ {
    ;~ try ; leads to having the script re-launching itself as administrator
    ;~ {
        ;~ if A_IsCompiled
            ;~ Run *RunAs "%A_ScriptFullPath%" /restart
        ;~ else
            ;~ Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    ;~ }
    ;~ ExitApp
;~ }

#SingleInstance force
#NoEnv  
#Warn  
#Persistent 


F6::
IfWinActive, Guild Wars 2
    {
        BlockInput, MouseMove
        Click
        Sleep, 150
        SendInput +{WheelDown}
        Sleep, 500
        Send, {Esc}
        Click
        BlockInput, MouseMoveOff
    }
Else
        Send {F6}
Return

+F6::
        ExitApp
return