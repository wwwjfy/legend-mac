--function oldevent_759()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2659,74,0);   --  1(1):[北丑]说: 我那个邻居胡小子刀谱缺了*两页，练功练的很郁闷．如*果你能帮他找回失物，他肯*定会感激不尽的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,1,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

