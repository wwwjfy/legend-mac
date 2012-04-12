--function oldevent_342()

    if instruct_4(132,1,0) ==false then    --  4(4):是否使用物品[赏善罚恶令]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(1247,43,0);   --  1(1):[白万剑]说: 小兄弟，这可不能反悔的，*是你自己抢着去侠客岛的，*与老夫无关．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_37(-1);   --  37(25):增加道德-1
--end

