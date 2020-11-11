Gui, Add, Edit, vSearchContent w300 H20 Limit50 HwndSearchGuiHwnd cFFFFFF xs y+10 -Multi -WantReturn -Border, 
Gui, +LastFound -Caption +ToolWindow ; 隐藏窗口标题栏
Gui, Font, cFFFFFF s14, Microsoft YaHei UI Bold
Gui, Font, cFFFFFF s14, Hiragino Sans GB W6 ;首选字体
Gui, Font, cFFFFFF s20, w20 微软雅黑
Gui, Color, 0x555555, 0xee2255 ; 设置窗口颜色与 edit 控件背景颜色
Gui, Add, Button, w0 h0 Default, Submit ; 添加不显示的按钮实现回车提交
OnMessage(0x201, "MoveWin") ; 响应窗口拖动

; 窗口关闭操作
GuiEscape:
GuiClose:
    Gui,Hide
return

; 窗口展示
^space::
    SearchContent := ""
    Gui, Show,, ""
return 

; 响应回车请求
ButtonSubmit:
Gui, Submit, Hide 
; MsgBox, Content of the edit control: %SearchContent%
RUN, https://www.google.com/search?q=%SearchContent%
return

; 拖动窗口
MoveWin()
{
    PostMessage, 0xA1, 2
    return
}