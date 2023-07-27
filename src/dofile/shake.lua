-- 每次睡眠增加time和time2 当time大于Decline_range时，下压
-- 一开始下压力度为4，每次下压后time2增加FrequencyZ
-- 当time2在100ms内时，连续下压4次
-- 当time2在200ms内时，连续下压3次
-- 当time2在400ms内时，连续下压2次
-- 当time2大于400ms时，下压1次
-- 每次下压后time清零

-- holdShakeTime 开枪键按下保持时间
-- declineRange 下压间隔
-- declineTime  上次下压相对时间
-- pushDown 下压力度
-- declineTime 上次下压相对时间
function mouseRelativeByHoldShakeTime()
    if (declineTime >= declineRange) then
        local relativeTime = math.log(holdShakeTime / 100, 2)
        relativeTime = math.max(relativeTime, -1)
        relativeTime = math.min(relativeTime, 2)
        relativeTime = math.floor(relativeTime)
        relativeTime = 3 - relativeTime
        for _ = 1, relativeTime do
            MoveMouseRelative(0, pushDown)
        end
        declineTime = 0
    end
end

-- range 抖动幅度
-- frequency 抖动间隔
-- shakeNum 抖动次数
function rockShake()
    local horizontal = range
    if (model == 're') then
        horizontal = horizontal - 10
    end
    local vertical = range
    for _ = 1, shakeNum do
        MoveMouseRelative(-horizontal, -vertical)
        BetterSleep(frequency)
        MoveMouseRelative(horizontal, vertical)
        BetterSleep(frequency)
    end
end