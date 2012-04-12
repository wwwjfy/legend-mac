--function oldevent_911()
    instruct_3(-2,-2,-2,-2,-1,-1,-1,2612,2612,2612,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(174,700);   --  2(2):得到物品[银两][700]
    instruct_2(186,2);   --  2(2):得到物品[智慧果][2]

    if instruct_16(36,0,1) ==true then    --  16(10):队伍是否有[林平之]否则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_37(-2);   --  37(25):增加道德-2
--end

