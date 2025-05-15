; AutoHotkey v2 脚本

; --- 设置 (自动执行部分) ---
SetWorkingDir A_ScriptDir ; 将脚本的工作目录设置为脚本所在位置
CoordMode "Mouse", "Window" ; 坐标相对于活动窗口的客户区域，适合游戏内操作
SendMode "Event" ; 使用Event发送方法，对游戏更可靠，防止按键被游戏忽略
#SingleInstance Force ; 确保脚本只运行一个实例，启动新脚本时会替换旧实例
SetTitleMatchMode 2 ; 窗口标题只需包含指定字符串即可匹配
; WinActivateForce在AHK v2中已移除
SetControlDelay 1 ; 控件修改命令后的延迟（毫秒）
SetWinDelay 0 ; 窗口命令后的延迟（毫秒）
SetKeyDelay -1 ; 按键之间无延迟，提高宏执行速度
SetMouseDelay -1 ; 鼠标操作无延迟
; SetBatchLines在v2中已移除，脚本默认以最大速度运行

; --- 常用函数 ---
; 确认按键 ~ 需调用虚拟键. 
Confirm() {
    Loop(6) {
        ; VK45是E键的虚拟键码
        Send "{VK45 Down}"
        Sleep 50
        Send "{VK45 Up}"
        Sleep 10
    }
}

; 多次方向键上
MultiUp(num) {
    Loop (num) {
        Send "{Up Down}"
        Sleep 50
        Send "{Up Up}"
        Sleep 100
    }
}

; 多次方向键下
MultiDown(num) {
    Loop (num) {
        Send "{Down Down}"
        Sleep 50
        Send "{Down Up}"
        Sleep 100
    }
}

; 多次 Q 键 (退出大部分页面)
MultiQ(num) {
    Loop (num) {
        Send "{Q Down}"
        Sleep 50
        Send "{Q Up}"
        Sleep 200
    }
}

; 长按 T 键 (将法术/祷告调整至第一位)
LongT() {
    Send "{T Down}"
    Sleep 1000
    Send "{T Up}"
    Sleep 100
}

; 开始疾跑
RunStart(direction := "W") {
    if (direction = "W")
        Send "{W Down}"
    else if (direction = "S")
        Send "{S Down}"
    else if (direction = "A")
        Send "{A Down}"
    else if (direction = "D")
        Send "{D Down}"
    
    Sleep 50
    Send "{Space Down}"
}

; 结束疾跑
RunEnd(direction := "W") {
    Send "{Space Up}"
    
    if (direction = "W")
        Send "{W Up}"
    else if (direction = "S")
        Send "{S Up}"
    else if (direction = "A")
        Send "{A Up}"
    else if (direction = "D")
        Send "{D Up}"
}

; 小退 - 打开退出页面
QuitToMainOpen() {
    ; --- 退出到开始页面的按键序列 ---
    ; 打开游戏内菜单
    Send "{Esc Down}"
    Sleep 50  ; 按住时间确保游戏注册按键
    Send "{Esc Up}"
    Sleep 15  ; 短暂等待菜单响应

    ; 移动到"系统"选项
    Send "{Up Down}"
    Sleep 50
    Send "{Up Up}"
    Sleep 15

    ; 选择"系统"
    Send "{E Down}"
    Sleep 50
    Send "{E Up}"
    Sleep 40

    ; 移动至"退出游戏"页
    Send "{Z Down}"
    Sleep 50
    Send "{Z Up}"
    Sleep 15

    ; 默认退出至主菜单，确认选择
    Send "{E Down}"
    Sleep 50
    Send "{E Up}"
    Sleep 15

    ; 在确认对话框中选择"是"
    Send "{Left Down}"
    Sleep 50
    Send "{Left Up}"
}

; 小退 - 安全
QuickExitToMainMenu() {
    ; 阻止用户输入，防止干扰宏操作
    try 
    {
        BlockInput true
        
        QuitToMainOpen()  ; 调用退出函数
        
        Sleep 400  ; 等待内置延迟检测结束

        Confirm()
    }
    finally 
    {
        ; 确保恢复用户输入能力
        BlockInput false
    }
}

; 传送至首个标记赐福点
TeleportToFirstMarkedGrace() {
    ; 打开地图
    Send "{M Down}"
    Sleep 50
    Send "{M Up}"
    Sleep 300

    ; 打开赐福列表
    Send "{F Down}"
    Sleep 50
    Send "{F Up}"
    Sleep 300

    ; 切换至标记赐福页
    Send "{F Down}"
    Sleep 50
    Send "{F Up}"
    Sleep 300

    ; 选择第一个标记赐福点
    Send "{E Down}"
    Sleep 50
    Send "{E Up}"
    Sleep 300

    Confirm()
}

MongeTheBankPresident() {
    ; 执行传送函数
    TeleportToFirstMarkedGrace()
    ; 等待游戏加载
    Sleep 5000

    Send "{W Down}"
    Sleep 500
    Send "{W Up}"
    Sleep 100

    Send "{E Down}"
    Sleep 50
    Send "{E Up}"

    Sleep 4000

    MultiUp(2)

    Send "{E Down}"
    Sleep 50
    Send "{E Up}"
    Sleep 500

    MultiDown(3)

    Loop 2 {
        Send "{E Down}"
        Sleep 50
        Send "{E Up}"
        Sleep 500
    }
    
    MultiUp(9)

    Loop 2 {
        Send "{E Down}"
        Sleep 50
        Send "{E Up}"
        Sleep 500
    }

    MultiDown(2)

    Send "{E Down}"
    Sleep 50
    Send "{E Up}"
    Sleep 500

    Send "{Left Down}"
    Sleep 50
    Send "{Left Up}"
    Sleep 500

    Confirm()

    Sleep 1000

    ; MultiQ(6)

    TeleportToFirstMarkedGrace()
    ; 等待游戏加载
    Sleep 4500

    LongT()

    Send "{Click Down}"
    Sleep 50
    Send "{Click Up}"
    Sleep 2000

    RunStart()

    Sleep 9000

    Send "{D Down}"

    Sleep 4000

    RunEnd()
    Send "{D Up}"

    Sleep 16000

    RunStart()
    Sleep 2000
    RunEnd()

    Sleep 500

    RunStart("S")
    Sleep 3500
    RunEnd("S")
    Sleep 100

    QuickExitToMainMenu()

    Sleep 10000

    Loop 2 {
        Send "{E Down}"
        Sleep 50
        Send "{E Up}"
        Sleep 1500
    }

    Sleep 5000

    Send "{U Down}"
    Sleep 875
    Send "{U Up}"
    Sleep 10

    RunStart()
    Sleep 1750
    RunEnd()
    Sleep 100

    Send "{E Down}"
    Sleep 50
    Send "{E Up}"
    Sleep 10

    Send "{A Down}"
    Loop (15) {
        Send "{E Down}"
        Sleep 50
        Send "{E Up}"
        Sleep 10
    }
    Send "{A Up}"

    Send "{D Down}"
    Loop (15) {
        Send "{E Down}"
        Sleep 50
        Send "{E Up}"
        Sleep 10
    }
    Send "{D Up}"

    Sleep 3000

    Loop (2) {
        Send "{Click Down}"
        Sleep 50
        Send "{Click Up}"
        Sleep 10
    }
    
    Sleep 1000

    RunStart()
    Sleep 4000
    RunEnd()
    Sleep 100

    Send "{E Down}"
    Sleep 50
    Send "{Z Down}"
    Sleep 100
    Send "{Z Up}"
    Send "{E Up}"

    Sleep 40000
}

; --- 热键部分 ---

#HotIf WinActive("ELDEN RING™ ahk_class ELDEN RING™")
; V 热键: 快速退出到开始页面
V:: QuickExitToMainMenu()

; B 热键: 快速打开退出页面. 允许用户自行等待可退出条件 (如点火时等成功背景音效)
B:: {

    ; 阻止用户输入，防止干扰宏操作
    try 
    {
        BlockInput true
        
        QuitToMainOpen()  ; 调用退出函数
    }
    finally 
    {
        ; 确保恢复用户输入能力
        BlockInput false
    }
}

; Ctrl+Shift+P 热键: 利用 Boss 复活 mod 自动复活/击杀行长刷魂
^+P:: {
    Loop {
        MongeTheBankPresident()
    }
}
#HotIf ; 结束热键条件

; F8 热键：重新加载脚本（方便调试和修改后刷新）
F8:: {
    Reload()
}

; 建议设置一个退出热键，特别是对于长时间运行的脚本
; 可以取消下面注释来启用F9作为退出热键：
; F9:: {
; ExitApp()  ; 完全终止脚本
; }

