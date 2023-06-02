-----------------------------
Range = (6//(HS_LMD*HS_ADS))+3+Adjustment
Decline_range = 8*HS_LMD
OutputLogMessage("HS-QQ-       215553307\n" )
OutputLogMessage("HS-QQ-       215553307\n" )
--唯一qq：215553307 （其他都是倒卖）

OutputLogMessage("================================" )
OutputLogMessage("   -- -- -- -- -- -- -- -- -- -- -\n" )
OutputLogMessage("||   HS-QQ-     215553307     ||" )
OutputLogMessage("  |       QQqun 785414446         |\n" )
OutputLogMessage("================================" )
OutputLogMessage("   -- -- -- -- -- -- -- -- -- -- - ")
local switch = false
if(Xian_Yu_ID == "ID:HS_GZS_QQ_215553307 "   and Xian_Yu == "HeiShen_Gong_Zuo_Shi_QQqun_785414446"  )then
    switch =  true
else
    switch = false
end



EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)



    function YJHJ()
        for i=48000,35289,-3600 do
            MoveMouseTo(12909, i)
            Sleep(22)
            PressAndReleaseMouseButton(1)
            Sleep(22)
        end
        PressAndReleaseKey("tab")
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == HS_HJ) then

        PressKey(UseKey)
        Sleep(500)
        ReleaseKey(UseKey)
        Sleep(50)
        YJHJ()
    end


    if (event == "MOUSE_BUTTON_PRESSED" and arg == HS_SG == true) then
        PressKey("spacebar")
        Sleep(5)
        PressKey("c")
        Sleep(5)
        ReleaseKey("spacebar")
        Sleep(5)
        ReleaseKey("c")
        Sleep(5)
    end


    time  = 0
    time2 = 0
    Fast_Decline = Range * 12

    if (HS_KaiGuan == 888 and Xian_Yu == "HeiShen_Gong_Zuo_Shi_QQqun_785414446"   and Xian_Yu_ID == "ID:HS_GZS_QQ_215553307 " )then
        if (IsKeyLockOn("capslock")) then
            switch = true
        else
            switch = false
        end
    else

        if (event == "MOUSE_BUTTON_PRESSED" and arg == HS_KaiGuan) then
            switch = not switch
        end
    end

    if (HS_KaiGuan == 777 and Xian_Yu == "HeiShen_Gong_Zuo_Shi_QQqun_785414446"   and Xian_Yu_ID == "ID:HS_GZS_QQ_215553307 " )then
        if (IsKeyLockOn("ScrollLock")) then
            switch = true
        else
            switch = false
        end
    else

        if (event == "MOUSE_BUTTON_PRESSED" and arg == HS_KaiGuan) then
            switch = switch
        end
    end


    if (switch == true) then
        while(IsMouseButtonPressed(3))
        do
            if ( IsMouseButtonPressed(1) and Kai__Jing == 1 ) then
                MoveMouseRelative(Range, -Range)
                Sleep(Frequency)
                time = time + Frequency
                MoveMouseRelative(-Range, Range)
                Sleep(Frequency)
                time = time + Frequency
                if( time >= Decline_range )then
                    MoveMouseRelative(0, ((Fast_Decline//12)+1))
                    time = 0
                    if (Fast_Decline >0 )then
                        Fast_Decline = Fast_Decline - 2
                    else
                        Fast_Decline = 0
                    end
                    time = 0
                end
            end
        end
        time2 = 0
    end
    if (switch == true and Kai__Jing == 2 ) then
        if ( event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
            repeat
                MoveMouseRelative(Range, -Range)
                Sleep(Frequency)
                time = time + Frequency
                MoveMouseRelative(-Range, Range)
                Sleep(Frequency)
                time = time + Frequency
                if( time >= Decline_range )then
                    MoveMouseRelative(0, ((Fast_Decline//12)+1))
                    time = 0
                    if (Fast_Decline >0 )then
                        Fast_Decline = Fast_Decline - 2
                    else
                        Fast_Decline = 0
                    end
                    time = 0
                end
            until(not IsMouseButtonPressed(1) )
        end
        time2 = 0
    end




    function BetterSleep(t)
        sleep_start_time = GetRunningTime()
        repeat
            sleep_end_time = GetRunningTime()
            sleep_elapsed = sleep_end_time-sleep_start_time

        until(sleep_elapsed>t)
    end
    --唯一qq：215553307 （其他都是倒卖）
    --售后更新1群：785414446（备注购买的昵称申请-更新售后群）
    --售后更新2群：785906665（备注购买的昵称申请-更新售后群）
    --售后更新3群：296706660（备注购买的昵称申请-更新售后群）
    --认准头像：黑神工作室（其他都是倒卖）
    if (Xian_Yu_ID ~= "ID:HS_GZS_QQ_215553307 "  or Xian_Yu ~= "HeiShen_Gong_Zuo_Shi_QQqun_785414446" ) then
        if (event == "MOUSE_BUTTON_PRESSED" and arg ~= 1)then
            PressAndReleaseKey("escape")
            Sleep(35)
            MoveMouseTo(32767,37767)
            Sleep(35)
            PressAndReleaseMouseButton(1)
            Sleep(35)
            MoveMouseTo(29000,44000)
            Sleep(35)
            PressAndReleaseMouseButton(1)
            Sleep(35)
            PressKey("lalt")
            Sleep(35)
            PressAndReleaseKey("f4")
            ReleaseKey("lalt")
        end
    end
end
--唯一qq：215553307 （其他都是倒卖）
--售后更新1群：785414446（备注购买的昵称申请-更新售后群）
--售后更新2群：785906665（备注购买的昵称申请-更新售后群）
--售后更新3群：296706660（备注购买的昵称申请-更新售后群）
--认准头像：黑神工作室（其他都是倒卖）