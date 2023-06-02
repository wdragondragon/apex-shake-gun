BILIBILI_ID = "ID:reasnow_hcl"
--请认准作者B站reasnowhcl
Zuo_Zhe = "Xing_Ji_Hai_Dao_Hcl"
--作者ID星际海盗_HCL
FangWei = "QQ群560931068_S1配套专用压枪lua_Hcl"
--倒卖可耻，倒卖无售后无更新


Kai_Jing = 1
--设置开开镜方式，1为按住开镜，2为切换开

Frequency = 9
Range = 19
Decline = 100


--------------------------------------

SwitchButton = 888

EnablePrimaryMouseButtonEvents(true)


function OnEvent(event, arg)
    ClearLog()
    function BetterSleep(t)
        sleep_start_time = GetRunningTime()
        repeat
            sleep_end_time = GetRunningTime()
            sleep_elapsed = sleep_end_time-sleep_start_time

        until(sleep_elapsed>t)
    end




    function YJHJ()
        for i=40700,53933,4411 do
            MoveMouseTo(12909, i)
            Sleep(13)
            PressAndReleaseMouseButton(1)
            Sleep(13)
        end
        PressAndReleaseKey("escape")
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == YJHJButton) then

        PressKey(UseKey)
        Sleep(500)
        ReleaseKey(UseKey)
        Sleep(50)
        YJHJ()
    end



    time  = 0
    switch = true
    while(0)
    do
        time2  = 0

        if (SwitchButton == 888 and BILIBILI_ID == "ID:reasnow_hcl"  and Zuo_Zhe == "Xing_Ji_Hai_Dao_Hcl" )then
            if (IsKeyLockOn("capslock")) then
                switch = true
            else
                switch = false
            end
        elseif (event == "MOUSE_BUTTON_PRESSED" and arg == SwitchButton) then
            PressAndReleaseKey("capslock")
        end


        if ( IsMouseButtonPressed(1) and switch == true and BILIBILI_ID == "ID:reasnow_hcl"  and Zuo_Zhe == "Xing_Ji_Hai_Dao_Hcl" and Kai_Jing == 2) then
            repeat
                MoveMouseRelative(-Range, Range+10)
                BetterSleep(Frequency)
                time2 = time2 + Frequency
                MoveMouseRelative(Range, -Range-10)
                BetterSleep(Frequency)
                MoveMouseRelative(-Range, Range+10)
                BetterSleep(Frequency)
                time2 = time2 + Frequency
                MoveMouseRelative(Range, -Range-10)
                BetterSleep(Frequency)
                MoveMouseRelative(-Range, Range+10)
                BetterSleep(Frequency)
                time2 = time2 + Frequency
                MoveMouseRelative(Range, -Range-10)
                BetterSleep(Frequency)
                time = time + 1
                time2 = time2 + Frequency
                if( time >= Decline )then
                    MoveMouseRelative(0, 6)
                    if( time2 <= 300 )then
                        MoveMouseRelative(0, 6)
                        if( time2 <= 200 )then
                            MoveMouseRelative(0, 6)
                            if( time2 <= 100 )then
                                MoveMouseRelative(0, 6)
                            end
                        end
                    end
                end
            until(not IsMouseButtonPressed(1) )
        elseif(switch == true and Kai_Jing == 1)then
            while(IsMouseButtonPressed(3))do
                if ( IsMouseButtonPressed(1)    and BILIBILI_ID == "ID:reasnow_hcl"  and Zuo_Zhe == "Xing_Ji_Hai_Dao_Hcl") then
                    MoveMouseRelative(-Range, Range+10)
                    BetterSleep(Frequency)
                    time2 = time2 + Frequency
                    MoveMouseRelative(Range, -Range-10)
                    BetterSleep(Frequency)
                    MoveMouseRelative(-Range, Range+10)
                    BetterSleep(Frequency)
                    time2 = time2 + Frequency
                    MoveMouseRelative(Range, -Range-10)
                    BetterSleep(Frequency)
                    MoveMouseRelative(-Range, Range+10)
                    BetterSleep(Frequency)
                    time2 = time2 + Frequency
                    MoveMouseRelative(Range, -Range-10)
                    BetterSleep(Frequency)
                    time = time + 1
                    time2 = time2 + Frequency
                    if( time >= Decline )then
                        MoveMouseRelative(0, 6)
                        if( time2 <= 300 )then
                            MoveMouseRelative(0, 6)
                            if( time2 <= 200 )then
                                MoveMouseRelative(0, 6)
                                if( time2 <= 100 )then
                                    MoveMouseRelative(0, 6)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function Chinese(a)
    local b = ""
    for i=1 , #a  do
        b = b..string.char(a[i])
    end
    return b
end