--function oldevent_162()
    instruct_3(-2,-2,-2,-2,-1,-1,-1,2492,2492,2492,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(6,5);   --  2(2):得到物品[三黄宝腊丹][5]

    if instruct_16(9,0,1) ==true then    --  16(10):队伍是否有[张无忌]否则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_37(-1);   --  37(25):增加道德-1
--end

