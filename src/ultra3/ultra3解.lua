S = 1
points1 = { { 9018, 52330 }, { 9018, 50853 }, { 9018, 48967 }, { 9018, 46834 }, { 9018, 44784 }, { 9018, 42733 }, { 9018, 40272 }, { 9018, 38632 } }
points2 = { { 12738, 42941 },
            { 12294, 47435 },
            { 11782, 37475 },
            { 11850, 33405 },
}
points3 = { { 12344, 41990 },
            { 12497, 46453 },
            { 12907, 35341 },
            { 12754, 39348 }, }
points4 = { { 12907, 42051 },
            { 12523, 45985 },
            { 12062, 36518 },
            { 12139, 33116 }, }
points5 = { { 12636, 41813 },
            { 12260, 45585 },
            { 12567, 32795 },
            { 12636, 36785 }, }
points6 = { { 12861, 40231 },
            { 12451, 42921 },
            { 12554, 33120 },
            { 12400, 36259 }, }
Frequency = 5
Range = 19
Decline = 4

function Q(a)
    local b = ""
    for i = 1, #a do
        b = b .. string.char(a[i])
    end
    return b
end
EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)
    ClearLog()
    while (0) do
        if IsModifierPressed("lalt") then
            if fbl == 1 then
                YJHJ1()
            end
            if fbl == 2 then
                YJHJ2()
            end
            if fbl == 3 then
                YJHJ3()
            end
            if fbl == 4 then
                YJHJ4()
            end
            if fbl == 5 then
                YJHJ5()
            end
            if fbl == 6 then
                YJHJ6()
            end
        end

        if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
            x, y = GetMousePosition()
            OutputLogMessage("{ %d , %d},\n", x, y)
        end
        function BetterSleep(t)
            sleep_start_time = GetRunningTime()
            repeat
                sleep_end_time = GetRunningTime()
                sleep_elapsed = sleep_end_time - sleep_start_time

            until (sleep_elapsed > t)
        end
        function YJHJ1()
            PressKey("e")
            Sleep(yc1)
            ReleaseKey("e")
            for k, v in ipairs(points1) do
                Sleep(5)
                MoveMouseTo(v[1], v[2]);
                Sleep(5)
                PressMouseButton(1)
                Sleep(5)
                ReleaseMouseButton(1)
            end
            Sleep(30)
            PressKey("tab")
            Sleep(5)
            ReleaseKey("tab")
        end
        function YJHJ2()
            PressKey("e")
            Sleep(yc1)
            ReleaseKey("e")
            for k, v in ipairs(points2) do
                Sleep(5)
                MoveMouseTo(v[1], v[2]);
                Sleep(5)
                PressMouseButton(1)
                Sleep(5)
                ReleaseMouseButton(1)
            end
            Sleep(30)
            PressKey("tab")
            Sleep(5)
            ReleaseKey("tab")
        end
        function YJHJ3()
            PressKey("e")
            Sleep(yc1)
            ReleaseKey("e")
            for k, v in ipairs(points3) do
                Sleep(5)
                MoveMouseTo(v[1], v[2]);
                Sleep(5)
                PressMouseButton(1)
                Sleep(5)
                ReleaseMouseButton(1)
            end
            Sleep(30)
            PressKey("tab")
            Sleep(5)
            ReleaseKey("tab")
        end
        function YJHJ4()
            PressKey("e")
            Sleep(yc1)
            ReleaseKey("e")
            for k, v in ipairs(points4) do
                Sleep(5)
                MoveMouseTo(v[1], v[2]);
                Sleep(5)
                PressMouseButton(1)
                Sleep(5)
                ReleaseMouseButton(1)
            end
            Sleep(30)
            PressKey("tab")
            Sleep(5)
            ReleaseKey("tab")
        end
        function YJHJ5()
            PressKey("e")
            Sleep(yc1)
            ReleaseKey("e")
            for k, v in ipairs(points5) do
                Sleep(5)
                MoveMouseTo(v[1], v[2]);
                Sleep(5)
                PressMouseButton(1)
                Sleep(5)
                ReleaseMouseButton(1)
            end
            Sleep(30)
            PressKey("tab")
            Sleep(5)
            ReleaseKey("tab")
        end
        function YJHJ6()
            PressKey("e")
            Sleep(yc1)
            ReleaseKey("e")
            for k, v in ipairs(points6) do
                Sleep(5)
                MoveMouseTo(v[1], v[2]);
                Sleep(5)
                PressMouseButton(1)
                Sleep(5)
                ReleaseMouseButton(1)
            end
            Sleep(30)
            PressKey("tab")
            Sleep(5)
            ReleaseKey("tab")
        end
        if S == 1 then
            FF = { 1, 16, 0 }
        end
        if S == 2 then
            FF = { 5, 19, 1 }
        end

        time = 0
        time2 = 0
        qidong = 1
        Frequencyq = 5
        Adjustmentq = 0

        Rangeq = (6 // (LMD * ADS)) + 3 + Adjustmentq
        Decline_rangeq = 8 * LMD
        Fast_Declineq = Rangeq * 12

        if (S > 0) then

            if (m == 1) then
                if (IsKeyLockOn("capslock")) then
                    qidong = 1
                else
                    qidong = 0
                end
            else
                qidong = 1
            end
        end

        if (qidong == 1) then
            --启动
            if 1 then
                --键鼠抖
                while (IsMouseButtonPressed(3))
                do
                    if (IsMouseButtonPressed(1)) then
                        MoveMouseRelative(Rangeq, -Rangeq)
                        Sleep(Frequencyq)
                        time = time + Frequencyq
                        MoveMouseRelative(-Rangeq, Rangeq)
                        Sleep(Frequencyq)
                        time = time + Frequencyq
                        if (time >= Decline_rangeq) then
                            MoveMouseRelative(0, ((Fast_Declineq // 12) + 1))
                            time = 0
                            if (Fast_Declineq > 0) then
                                Fast_Declineq = Fast_Declineq - 2
                            else
                                Fast_Declineq = 0
                            end
                        end
                    end
                end
            end
        end
    end
end