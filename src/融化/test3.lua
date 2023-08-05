function test()
    while(true)
    do
        if(IsMouseButtonPressed(1)) then
            OutputLogMessage("test\n")
        end
    end
end
function OnEvent(event, arg)
    OutputLogMessage("test\n")
end
pcall(test())