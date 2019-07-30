

; 修改 PrintScreen 键为 QQ 截图快捷键 Ctrl+Alt+A
PrintScreen::Send ^!a
; PrintScreen::
; IfExist, lib\PrScrn.dll
; {
;     DllCall("lib\PrScrn.dll\PrScrn")
; }
; return

; Ctrl+W 或 Esc 关闭记事本
#IfWinActive, ahk_class Notepad
Esc::WinClose, A
$^w::WinClose, A
return

; 屏幕上边缘滚动鼠标滚轮来调节音量.
#If MouseIsOver("t")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
; LButton::send {Media_Play_Pause} ; 容易误触发
return
#If

; 屏幕左上角点击静音.
#If MouseIsOver("lt")
LButton::Send {Volume_Mute}
return

; 屏幕上边缘偏右侧点击播放/停止音乐
; #If MouseIsOver("tl")
; LButton::send {Media_Play_Pause}
; return
; #If

; 屏幕左边缘滚动滚轮翻页.
#If MouseIsOver("l")
WheelUp::Send {PgUp}
WheelDown::Send {PgDn}
return
#If

; 在任务栏上滚动鼠标切换 win10 虚拟桌面.
#If MouseIsOver("control", "ahk_class Shell_TrayWnd")
WheelUp::Send ^#{left}
WheelDown::Send ^#{right}
return
#If

; CapsLock 键增强 START
CapsLock::
KeyWait, CapsLock
if (A_ThisHotkey="CapsLock")
{
    SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
    ; 双击粘贴
    If ((A_PriorHotkey = "CapsLock" ) AND (A_TimeSincePriorHotkey < 400))
    {
        SendInput ^v
    }
}
Return

#if GetKeyState("Capslock", "P")

; 快捷搜索
q::
QuickSearchBar()
return

; vim 模式 Capslock + hjkl (left, down, up, right)
k:: SendInput,{Up}
j:: SendInput,{down}
h:: SendInput,{left}
l:: SendInput,{right}

; 行首、行末
f:: SendInput,{home}
`;:: SendInput,{end}

; 删除光标所在行
BackSpace:: SendInput,{End}+{home}{bs}

; 回车换行
Enter::
SendInput,{End}
SendInput,{Enter}
return

; 播放暂停音乐
Space:: SendInput,{Media_Play_Pause}
#if
; CapsLock 键增强 END

; 屏幕取色
#c::
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
; 截取 color（第二个 color） 右边的 6 个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = #%color%
; 把 color 的值发送到剪贴板
return