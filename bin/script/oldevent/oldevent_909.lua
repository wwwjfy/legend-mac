--function oldevent_909()
    instruct_3(-2,-2,-2,-2,-1,-1,-1,2468,2468,2468,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(16,2);   --  2(2):得到物品[九转熊蛇丸][2]

    if instruct_16(49,0,1) ==true then    --  16(10):队伍是否有[虚竹]否则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_37(-1);   --  37(25):增加道德-1
--end

