; 单例运行
#SingleInstance Force

; 全局变量
; global 

; 修改托盘图标
IfExist, oneTool.ico
{
    Menu, TRAY, Icon, oneTool.ico, , 1
}

; 功能函数定义
#Include, functions.ahk

; 按键映射绑定
#Include, keyBind.ahk

