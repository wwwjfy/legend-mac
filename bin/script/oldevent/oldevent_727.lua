--function oldevent_727()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2627,73,0);   --  1(1):[南贤]说: 武当派的张真人，对於提携*後进一向不遗余力，你若有*空，可常向他讨教，肯定获*益良多．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,0,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

