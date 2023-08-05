QQ = "1327571293"
key = "QQ1327571293"
LMD = 1.1
ADS = 0.4
SwitchButton = 888
YJHJButton = 0
Frequency = 6
Adjustment = 0
UseKey = 0x12
UseKey = 0x12555555555
Level = 55555555
Decline = 5555555555
Level = 55555555
Decline = 55555555
UseKey = 0x12
Level = 555555555555555555555555555555555
Decline = 5555555555
UseKey = 0x12555555555
Level = 55555555
Decline = 5555555555
Level = 55555555
Decline = 55555555
UseKey = 0x12
Range = (6 // (LMD * ADS)) + 3 + Adjustment
Decline_range = 8 * LMD
local switch = true
EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)
    points = {
        -- X,Y,Time(ms)
        { 11577, 34195, 5 },
        { 11577, 38568, 5 },
        { 11577, 42819, 5 },
        { 11577, 46342, 5 },
        { 11577, 50776, 5 },
    }
    function YJHJ()
        for k, v in ipairs(points) do
            Sleep(1)
            MoveMouseTo(v[1], v[2]);
            Sleep(1)
            PressMouseButton(1)
            Sleep(v[3])
            ReleaseMouseButton(1)
        end
        PressAndReleaseKey("escape")
    end
    function QQ1327571293(event, arg)
        on = true
    end
    banben = 1327571293
    riqi = 2022
    if (event == "MOUSE_BUTTON_PRESSED" and arg == YJHJButton) then
        PressKey(UseKey)
        Sleep(500)
        ReleaseKey(UseKey)
        Sleep(50)
        YJHJ()
    end
    time = 0
    Fast_Decline = Range * 12
    if (SwitchButton == 888) then
        if (IsKeyLockOn("capslock")) then
            switch = true
        else
            switch = false
        end
    else
        if (event == "MOUSE_BUTTON_PRESSED" and arg == SwitchButton) then
            switch = not switch
        end
    end
    if (switch == true) then
        while (IsMouseButtonPressed(3))
        do
            if (IsMouseButtonPressed(1)) then
                MoveMouseRelative(Range, -Range)
                Sleep(Frequency)
                time = time + Frequency
                MoveMouseRelative(-Range, Range)
                Sleep(Frequency)
                time = time + Frequency
                if (time >= Decline_range) then
                    MoveMouseRelative(0, ((Fast_Decline // 12) + 1))
                    time = 0
                    if (Fast_Decline > 0) then
                        Fast_Decline = Fast_Decline - 2
                    else
                        Fast_Decline = 0
                    end
                end
            end
        end
    end
end




