LMD = 1.9
--LMD输入游戏内鼠标灵敏度
ADS = 1.0
--ADS输入游戏内ADS鼠标灵敏度,也叫开镜灵敏度，默认1.0
SwitchButton = 888
--SwitchButton设置抖枪开关鼠标按键，可自行修改,改为888为大小写开关
Kai_Jing = 1
--Kai_Jing设置开镜方式，1为按住开镜，2为切换开镜
YJHJButton = 999
--YJHJButton设置一键换甲鼠标按键，可自行修改（目前只可以修改鼠标按键）




Xian_Yu_ID = "ID:tb305645003"

Xian_Yu = "Hong_Shi_Liu_De_Ou_Zhou_Bai_La_45_46"

FangWei = "请认准作者闲鱼ID:tb305645003_昵称:红石榴的欧洲白蜡45_46"

Level = 5
--Level设置抖枪等级，数值越大抖动幅度越大
Decline = 5
--Decline设置下压力度，数值越小下压力度越大
Frequency = 4
UseKey = 0x12
--杂项参数，一般不需要调整


zuozhe = "作者：面包🍞"
banben = "版本："
douqiang = "罗技抖枪宏"
xianyunicheng = "闲鱼昵称：红石榴的欧洲白蜡"
xianyuid = "闲鱼"
quanwangdujia = "全网独家手柄宏，倒卖无售后无更新！"
qun = "群"
tiyan = "免费体验"

kaiguan = "开关："
kaijing = "开镜方式："
test = "🎉🎉"

function Chinese(a)
    local b = ""
    for i = 1,#a do
        b = b..string.char(a[i])
    end
    return b
end
if(Kai_Jing == 1)then
    fangshi = "按住开镜"
elseif(Kai_Jing == 2)then
    fangshi = "切换开镜"
else
    fangshi = "错误！"
end

ClearLog()
OutputLogMessage("\n======================================================================\n" )
OutputLogMessage("||    "..zuozhe.."              "..xianyunicheng.."45_46    ||\n" )
OutputLogMessage("||    "..banben..douqiang.."V5.2       "..xianyuid.."ID:tb305645003                 ||\n" )
if(SwitchButton == 888)then
    anjian = "大小写按键"
    OutputLogMessage("||    "..kaiguan..anjian.."      " )
elseif(SwitchButton == 2)then
    anjian = "鼠标滚轮键"
    OutputLogMessage("||    "..kaiguan..anjian.."      " )
else
    shubiao = "鼠标"
    jian = "键"
    OutputLogMessage("||    "..kaiguan..shubiao.."G"..SwitchButton..jian.."        " )
end
OutputLogMessage("     "..kaijing..fangshi.."                 ||\n" )
OutputLogMessage("||          "..test..quanwangdujia..test.."           ||\n" )

OutputLogMessage("======================================================================" )


Range = (6//(LMD*ADS))+Level-2
Decline_range = (Decline+2)*LMD

local switch = false
if(Xian_Yu_ID == "ID:tb305645003"  and Xian_Yu == "Hong_Shi_Liu_De_Ou_Zhou_Bai_La_45_46" )then
    switch =  true
else
    switch = false
end

EnablePrimaryMouseButtonEvents(true)
function OnEvent(event, arg)


    --换甲
    function YJHJ()
        for i=35289,48000,3600 do
            MoveMouseTo(12909, i)
            Sleep(20)
            PressAndReleaseMouseButton(1)
            Sleep(20)
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


    --抖枪
    time  = 0
    time2 = 0
    Fast_Decline = Range * 12

    if (SwitchButton == 888 and Xian_Yu == "Hong_Shi_Liu_De_Ou_Zhou_Bai_La_45_46"  and Xian_Yu_ID == "ID:tb305645003" )then
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
        while(IsMouseButtonPressed(3))
        do
            if ( IsMouseButtonPressed(1) and Kai_Jing == 1 ) then
                MoveMouseRelative(-Range, -Range)
                BetterSleep(Frequency)
                time = time + Frequency
                time2 = time2 + Frequency
                MoveMouseRelative(Range, Range)
                BetterSleep(Frequency)
                time = time + Frequency
                time2 = time2 + Frequency
                if( time >= Decline_range )then
                    MoveMouseRelative(0, 1)
                    if( time2 <= 400 )then
                        MoveMouseRelative(0, 1)
                        if( time2 <= 200 )then
                            MoveMouseRelative(0, 1)
                            if( time2 <= 100 )then
                                MoveMouseRelative(0, 1)
                            end
                        end
                    end
                    time = 0
                end
            end
        end
        time2 = 0
    end
    if (switch == true and Kai_Jing == 2 ) then
        if ( event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
            repeat
                MoveMouseRelative(-Range, -Range)
                BetterSleep(Frequency)
                time = time + Frequency
                time2 = time2 + Frequency
                MoveMouseRelative(Range, Range)
                BetterSleep(Frequency)
                time = time + Frequency
                time2 = time2 + Frequency
                if( time >= Decline_range )then
                    MoveMouseRelative(0, 1)
                    if( time2 <= 400 )then
                        MoveMouseRelative(0, 1)
                        if( time2 <= 200 )then
                            MoveMouseRelative(0, 1)
                            if( time2 <= 100 )then
                                MoveMouseRelative(0, 1)
                            end
                        end
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



    --防伪
    if (Xian_Yu_ID ~= "ID:tb305645003"  or Xian_Yu ~= "Hong_Shi_Liu_De_Ou_Zhou_Bai_La_45_46" ) then
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