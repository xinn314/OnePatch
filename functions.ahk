

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
    WinShow, ahk_id %SearchGuiHwnd%
    TrayTip, %SearchContent%, %SearchGuiHwnd%, 20, 17
    return

    ; setSearchBarActive:
    IfWinExist, ahk_id %SearchGuiHwnd%
    {
        WinActivate, ahk_id %SearchGuiHwnd%
    }
    return
}
