--function oldevent_742()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2642,73,0);   --  1(1):[南贤]说: 老顽童喜欢养蜜蜂，所以送*他一瓶玉蜂浆好招蜂来．*你会有好报的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,0,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

