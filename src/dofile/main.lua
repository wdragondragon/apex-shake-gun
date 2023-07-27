-- JDragon改良，开镜开枪时能随时开关抖枪，不需要松开鼠标
-- 读取抖动，下压函数
shakeFile = 'D:\\Desktop\\shake.lua'
-- re 与 键鼠调整
model = 're'
--ADS输入游戏内ADS鼠标灵敏度,也叫开镜灵敏度，默认1.0
Kai_Jing = 1
--Kai_Jing设置开镜方式，1为按住开镜，2为切换开镜

switch = false
-- 控制下压时间
declineTime = 0
-- 开始抖枪时间
holdShakeTime = 0
-- 开关状态缓存间隔
freshCasLockFrequency = 50

-- 连发间隔
clickFrequency = 10
-- 连发绑定第二开枪键
secondClick = 'z'
-- 连发按键
clickKey = 5
-- 连发开关键 支持 capslock numlock scrolllock 不能与总开关相同（默认capslock）
clickSwitchToggle = "numlock"
-- 连发开关状态
clickSwitch = false

-- 连发键双用功能键，（定制：侧键 连发与功能键双用）
clickDoubleUse = 'z'

lastClickTime = GetRunningTime()
-- 开关状态最后刷新时间
lastFreshCasLockTime = GetRunningTime()

-- 最后刷新配置时间
lastLoadFileTime = GetRunningTime()
-- 刷新配置间隔
loadFileFrequency = 500


-- 以下为shake的配置,该文件里不应该使用
LMD = 3.0
pushDown = 1
shakeNum = 1
if (model == 're') then
    pushDown = 10
    shakeNum = 2
    LMD = 0.2
end
--LMD输入游戏内鼠标灵敏度
ADS = 1.0
--ADS输入游戏内ADS鼠标灵敏度,也叫开镜灵敏度，默认1.0
Level = 5
--Level设置抖枪等级，数值越大抖动幅度越大
Decline = 5
--Decline设置下压力度，数值越小下压力度越大
frequency = 4
-- 根据LMD和ADS调整Range和Decline_range
-- Range为左上右下抖动幅度
-- Decline_range为下压力度
-- Fast_Decline为快速下压力度
-- 6 对 LMS 乘于 ADS 取整的结果再加上 Level 减去 2
-- 例如：LMS = 5 / ADS = 1 / Level = 6 // (3 * 1) + 5 - 2 = 5
range = (6 // (LMD * ADS)) + Level - 2
declineRange = (Decline + 2) * LMD
-- 控制下压时间
declineTime = 0


EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)
    if (IsKeyLockOn("capslock")) then
        switch = true
    else
        switch = false
    end
    clickSwitch = IsKeyLockOn(clickSwitchToggle)
    clearTime()
    BetterSleep(5)
    if (Kai_Jing == 1) then
        while (IsMouseButtonPressed(3) or IsMouseButtonPressed(clickKey))
        do
            shake()
        end
    elseif (Kai_Jing == 2) then
        if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
            repeat
                shake()
            until (not IsMouseButtonPressed(1))
        end
    end
    clearTime()
end
-- 不需要停止线程的睡眠，另外使time计时递增
function BetterSleep(t)
    sleep_start_time = GetRunningTime()
    repeat
        sleep_end_time = GetRunningTime()
        sleep_elapsed = sleep_end_time - sleep_start_time
    until (sleep_elapsed > t)
    declineTime = declineTime + t
    holdShakeTime = holdShakeTime + t
end

function clearTime()
    declineTime = 0
    holdShakeTime = 0
    lastFreshCasLockTime = GetRunningTime()
end

--抖枪
function shake()
    pressed1 = IsMouseButtonPressed(1)
    pressed5 = IsMouseButtonPressed(clickKey)
    --pressed5 = false
    if (not pressed1 and not pressed5) then
        return
    end
    -- 根据LMD和ADS调整Range和Decline_range
    -- 先左上后右下
    checkSwitch()
    if (switch) then
        -- 可重写
        rockShake()
        -- 可重写
        mouseRelativeByHoldShakeTime()
    end
    if (pressed5) then
        clickShoot()
    end
end

function checkSwitch()
    local runningTime = GetRunningTime()
    if (runningTime - lastFreshCasLockTime > freshCasLockFrequency) then
        if (IsKeyLockOn("capslock")) then
            switch = true
        else
            switch = false
        end
        clickSwitch = IsKeyLockOn(clickSwitchToggle)
        lastFreshCasLockTime = runningTime
    end
    if (runningTime - lastLoadFileTime > loadFileFrequency) then
        loadFromFile()
        lastLoadFileTime = runningTime
    end
    return switch
end

function clickShoot()
    local runningTime = GetRunningTime()
    if (runningTime - lastClickTime > clickFrequency) then
        if (clickSwitch) then
            PressAndReleaseKey(secondClick)
        else
            PressAndReleaseKey(clickDoubleUse)
        end
        lastClickTime = runningTime
    end
end

function loadFromFile()
    OutputLogMessage("load file ,TIME:%s\n", GetRunningTime())
    dofile(shakeFile)
end