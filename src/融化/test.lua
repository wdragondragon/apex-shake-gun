local str = [[
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
]]

local fun, err = load((function()
    return str
end)())
if fun then
    -- 执行加载的函数
    fun()
else
    -- 打印加载错误信息
    OutputLogMessage("Error" + err)
end

pcall(test())