-- JDragon改良，开镜开枪时能随时开关抖枪，不需要松开鼠标
LMD = 3.0
--LMD输入游戏内鼠标灵敏度
ADS = 1.0
--ADS输入游戏内ADS鼠标灵敏度,也叫开镜灵敏度，默认1.0
SwitchButton = 888
--SwitchButton设置抖枪开关鼠标按键，可自行修改,改为888为大小写开关
Kai_Jing = 1
--Kai_Jing设置开镜方式，1为按住开镜，2为切换开镜
YJHJButton = 999
--YJHJButton设置一键换甲鼠标按键，可自行修改（目前只可以修改鼠标按键）
Level = 5
--Level设置抖枪等级，数值越大抖动幅度越大
Decline = 5
--Decline设置下压力度，数值越小下压力度越大
Frequency = 4
UseKey = 0x12
--杂项参数，一般不需要调整

-- 根据LMD和ADS调整Range和Decline_range
-- Range为左上右下抖动幅度
-- Decline_range为下压力度
-- Fast_Decline为快速下压力度
-- 6 对 LMS 乘于 ADS 取整的结果再加上 Level 减去 2
-- 例如：LMS = 5 / ADS = 1 / Level = 6 // (3 * 1) + 5 - 2 = 5
range = (6 // (LMD * ADS)) + Level - 2
declineRange = (Decline + 2) * LMD
fastDecline = range * 12

local switch = false
-- 控制下压时间
local declineTime = 0
-- 开始抖枪时间
local holdShakeTime = 0
-- 开关状态缓存间隔
local freshCasLockFrequency = 200

-- 连发间隔
local clickFrequency = 100
-- 连发绑定第二开枪键
local secondClick = 'z'
-- 连发按键
local clickKey = 5

local clickSwitch = false


local lastClickTime = GetRunningTime()
-- 开关状态最后刷新时间
local lastFreshCasLockTime = GetRunningTime()
EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)
    if (event == "MOUSE_BUTTON_PRESSED" and arg == YJHJButton) then
        PressKey(UseKey)
        Sleep(500)
        ReleaseKey(UseKey)
        Sleep(50)
        YJHJ()
    end
    if (SwitchButton == 888) then
        if (IsKeyLockOn("capslock")) then
            switch = true
        else
            switch = false
        end
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == SwitchButton) then
        switch = not switch
    end
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
--换甲
function YJHJ()
    for i = 35289, 48000, 3600 do
        MoveMouseTo(12909, i)
        Sleep(20)
        PressAndReleaseMouseButton(1)
        Sleep(20)
    end
    PressAndReleaseKey("escape")
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
        MoveMouseRelative(-range, -range)
        BetterSleep(Frequency)
    end

    if (pressed5) then
        clickShoot()
    end
    if (switch) then
        MoveMouseRelative(range, range)
        BetterSleep(Frequency)
        if (declineTime >= declineRange) then
            mouseRelativeByHoldShakeTime()
            declineTime = 0
        end
    end
end

function checkSwitch()
    if (SwitchButton ~= 888) then
        return
    end
    if (GetRunningTime() - lastFreshCasLockTime > freshCasLockFrequency) then
        if (IsKeyLockOn("capslock")) then
            switch = true
        else
            switch = false
        end
        lastFreshCasLockTime = GetRunningTime()
    end
    return switch
end

function clickShoot()
    if (GetRunningTime() - lastClickTime > clickFrequency) then
        PressAndReleaseKey(secondClick)
        lastClickTime = GetRunningTime()
    end
end
-- 每次睡眠增加time和time2 当time大于Decline_range时，下压
-- 一开始下压力度为4，每次下压后time2增加FrequencyZ
-- 当time2在100ms内时，连续下压4次
-- 当time2在200ms内时，连续下压3次
-- 当time2在400ms内时，连续下压2次
-- 当time2大于400ms时，下压1次
-- 每次下压后time清零\
function mouseRelativeByHoldShakeTime()
    relativeTime = math.log(holdShakeTime / 100, 2)
    relativeTime = math.max(relativeTime, -1)
    relativeTime = math.min(relativeTime, 2)
    relativeTime = math.floor(relativeTime)
    relativeTime = 3 - relativeTime
    for _ = 1, relativeTime do
        MoveMouseRelative(0, 1)
    end
end