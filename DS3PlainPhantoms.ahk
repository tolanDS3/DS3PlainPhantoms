#NoEnv
#SingleInstance Force
#Include <ClassMemory>
SetBatchLines -1
Global toggle := false
Return

#IfWinActive ahk_exe DarkSoulsIII.exe
    F11::
        Game := new _ClassMemory("ahk_exe DarkSoulsIII.exe", "", hProcessCopy)
        if(isObject(Game))
        {
            Param := Game.BaseAddress + 0x4782838
            For DefaultValue, Offset in {80:0x1F20,83:0x1F38,84:0x1F40,85:0x1F48,86:0x1F50,87:0x1F58,88:0x1F60,91:0x1F78}
            {
                If(toggle)
                    Game.Write(Param,DefaultValue,"Char",0x10C0,0x68,0x68,Offset)
                Else
                    Game.Write(Param,0,"Char",0x10C0,0x68,0x68,Offset)
            }
            toggle := !toggle
            Game := ""
        }
    Return
#If