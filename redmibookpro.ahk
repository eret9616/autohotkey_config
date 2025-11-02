#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

; 四指轻敲触发的快捷键（Ctrl+Alt+F12） 窗口最大化/缩放
^!F12::
{
    winState := WinGetMinMax("A")
    if (winState = 1)
        WinRestore("A")
    else
        WinMaximize("A")
}
