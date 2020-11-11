; Ctrl+W 或 Esc 关闭记事本
#IfWinActive, ahk_class Notepad
Esc::WinClose, A
$^w::WinClose, A
return

; 修改 PrintScreen 键为 QQ 截图快捷键 ^!a Ctrl+Alt+A
; 修改 PrintScreen 键为 微信截图快捷键 !a Alt+A
PrintScreen::Send !a
; PrintScreen::
; IfExist, lib\PrScrn.dll
; {
;     DllCall("lib\PrScrn.dll\PrScrn")
; }
; return


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
#If

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


; --- CapsLock 键增强 START ---
CapsLock::
KeyWait, CapsLock
if (A_ThisHotkey="CapsLock")
{
    ; 双击粘贴  
    If ((A_PriorHotkey = "CapsLock" ) AND (A_TimeSincePriorHotkey < 400))
    {
        SendInput ^v
    }


    ; 状态控制
    GetKeyState, state, CapsLock, T
        if (state = "D")
            SetCapsLockState, OFF
        else
            SetCapsLockState, ON


}
Return


#if GetKeyState("Capslock", "P")


; 快捷搜索
q:: SendInput,^{space}


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


; 翻译 ctrl+shift+B （设置欧陆词典迷你窗口查词快捷键后用于翻译唤起）
t:: SendInput,^+{B}


; 播放暂停音乐
; Space:: SendInput,{Media_Play_Pause}


; 窗口最小化
Down::
WinMinimize, A
return


; 移动窗口到左侧显示器
Left::
SendInput +#{left}
return


; 移动窗口到右侧显示器
Right::
SendInput +#{right}
return

; 穿透
; p::
; WinSet, ExStyle, +0x20,A
; return

; ; 取消穿透
; o::
; WinSet, ExStyle, -0x20,A
; return

; 置顶或取消置顶窗口
Space::
winset alwaysontop,toggle,A
winget, Transparent, Transparent, A
if (Transparent)
{
    winset Transparent,Off,A
    winset alwaysontop,off,A
}
else
{
    winset Transparent,235,A
    winset alwaysontop,on,A
}
return


; 以管理员身份打开 powersehll
r::
Run *RunAs powershell ,,
return

; 打开指定记事本
`::
settitlematchmode,2 ;设定ahk匹配窗口标题的模式
ifwinnotexist, everydayuse
{
    IfNotExist, note.txt
	{
		FileAppend,, note.txt
	}

    run notepad.exe note.txt
    winactivate,everydayuse ;激活窗口
    sleep,500
    WinSet, Transparent,230,A
    ; WinSet, Style, -0xC00000,A ; 隐藏标题栏
    winmove,everydayuse, 0, 0 ;设置窗口的大小，位置
    ; 调整光标位置
    SendInput,{End}
    SendInput,^{PgDn}
    SendInput,{Enter 2}
    SendInput,^{s}
    return
}


; 屏幕取色
c::
MouseGetPos, mouseX, mouseY
; 获得鼠标所在坐标，把鼠标的 X 坐标赋值给变量 mouseX ，同理 mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
; 调用 PixelGetColor 函数，获得鼠标所在坐标的 RGB 值，并赋值给 color
StringRight color,color,6
; 截取 color（第二个 color） 右边的 6 个字符，因为获得的值是这样的：#RRGGBB，一般我们只需要 RRGGBB 部分。把截取到的值再赋给 color（第一个 color）。
clipboard = #%color%
; 把 color 的值发送到剪贴板
showMsg(clipboard, 2500)
return

#if
; --- CapsLock 键增强 END ---