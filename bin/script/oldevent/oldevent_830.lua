--function oldevent_830()

    if instruct_4(170,1,0) ==false then    --  4(4):是否使用物品[金钥匙]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_3(-2,-2,-2,-2,-1,-1,-1,2608,2608,2608,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(9,5);   --  2(2):得到物品[黑玉断续膏][5]
--end

