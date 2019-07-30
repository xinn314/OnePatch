

; 判断鼠标是否在某一范围内
MouseIsOver(position, winTitle := "") {
    CoordMode, Mouse, Screen ; 指定鼠标坐标以屏幕为基准
    MouseGetPos, mouseX, mouseY, winId
    if (position == "l") { ; 左边缘
        return mouseX<10 && mouseY>10
    } else if (position == "t") { ; 上边缘
        return mouseY<10
    } else if (position == "lt") { ; 左上角
        return mouseX<10 && mouseY<10
    } else if (position == "tl") { ; 上边缘偏右侧
        return mouseX>1666 && mouseX<1800 && mouseY<1
    } else if (position == "control") { ; 窗口
        return WinExist(winTitle . " ahk_id " . winId)
    }
    return false
}

; 快速搜索框
QuickSearchBar() {
    Gui, Add, Text,, First name:
    Gui, Add, Text,, Last name:
    Gui, Add, Edit, vFirstName ym  ; ym 选项开始一个新的控件列.
    Gui, Add, Edit, vLastName
    Gui, Add, Button, default, OK  ; ButtonOK(如果存在)会在此按钮被按下时运行.
    Gui, Show,, Simple Input Example
    return  ; 自动运行段结束. 在用户进行操作前脚本会一直保持空闲状态.
}
