--function oldevent_496()

    if instruct_4(166,1,0) ==false then    --  4(4):是否使用物品[紫钥匙]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(166,-1);   --  32(20):物品[紫钥匙]+[-1]
    instruct_3(-2,-2,-2,-2,-1,-1,-1,2612,2612,2612,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(178,1);   --  2(2):得到物品[刘仲甫呕血棋谱][1]
--end

