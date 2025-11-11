#Requires AutoHotkey v2.0
#SingleInstance Force

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

; 将 `~ 键映射为左键点击（按下保持，松开释放）
`:: {
    Click "down"
}

` up:: {
    Click "up"
}

; f1 映射为ctrlq(配合Chrome的 previous tab插件)
F1:: Send "^q"

; F2 -> Ctrl+Tab
F2:: {
    Send "^{Tab}"
}

; F3 -> Shift+Ctrl+Tab
F3:: {
    Send "+^{Tab}"
}

; Esc -> Alt+Tab
Esc:: {
    Send "!{Tab}"
}

; F4 -> Esc
F4:: {
    Send "{Esc}"
}

; 右shift为win+tab 配合winterminator使用
RShift:: Send "#{Tab}"

; alt q 映射为 alt f4
!q:: Send("!{F4}")
; alt w 映射为 ctrl w 关闭当前(模仿macos)
!w:: Send "^w"
; alt a 映射为 ctrl a
!a:: Send "^a"

; ctrl 映射为 ctrl+l 便于在Chrome中控制地址栏
Ctrl:: {
    KeyWait("Ctrl", 0.3) ; 等待0.3秒，如果在这个时间内 Ctrl 被释放，则继续执行下面的代码
    if (GetKeyState("Ctrl") = 0) ; 如果 Ctrl 在0.3秒内被释放
        Send("^l") ; 发送 Ctrl+L 组合键
}

; shift映射为 ctrl+f 便于在Chrome中搜索查找
Shift:: {
    KeyWait("Shift", 0.3) ; 等待0.3秒，如果在这个时间内 Shift 被释放，则继续执行下面的代码
    if (GetKeyState("Shift") = 0) { ; 如果 Shift 在0.3秒内被释放
        Send "{Shift down}"
        Send "{Shift up}" ; 模拟按下并释放" Shift 键
        Send("^f") ; 发送 Ctrl+F 组合键
    }
}

; 右alt一直按住会映射为 ctrl + a,全选当前内容
RAlt:: {
    StartTime := A_TickCount
    while GetKeyState("RAlt", "P") {
        if (A_TickCount - StartTime) > 500 {
            Send "^a"
            return
        }
    }
    Send "{Shift down}"
    KeyWait "RAlt"
    Send "{Shift up}"
}

; capslock会映射为ctrl+t 便于在Chrome中开启新标签
CapsLock:: Send("^t")