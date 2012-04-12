--function oldevent_942()

    if instruct_4(168,1,0) ==false then    --  4(4):是否使用物品[铜钥匙]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_3(-2,-2,-2,-2,-1,-1,-1,2608,2608,2608,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(186,10);   --  2(2):得到物品[智慧果][10]
--end

