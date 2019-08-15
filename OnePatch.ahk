; 单例运行
#SingleInstance Force

; 全局变量
global SearchGuiHwnd,SearchContent

; 修改托盘图标
IfExist, onePatch.ico
{
    Menu, TRAY, Icon, onePatch.ico, , 1
}

; 功能函数定义
#Include, functions.ahk

; GUI 定义
#Include, GUIComponent.ahk

; 按键映射绑定
#Include, keyBind.ahk

