#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

; 四指轻敲触发的快捷键（Ctrl+Alt+F12） 窗口最大化/缩放
^!F12:: {
    winState := WinGetMinMax("A")
    if (winState = 1)
        WinRestore("A")
    else
        WinMaximize("A")
}

; Win + F 窗口最大化/缩放
#f:: {
    winState := WinGetMinMax("A")
    if (winState = 1)
        WinRestore("A")
    else
        WinMaximize("A")
}

; Ctrl + Alt + D 一键最小化当前窗口
^!d:: {
    WinMinimize("A")
}
