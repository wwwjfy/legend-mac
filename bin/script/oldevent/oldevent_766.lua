--function oldevent_766()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2666,74,0);   --  1(1):[北丑]说: 梅庄三庄主秃笔翁锺情於书*法，如果你能找到名家的书*法帖子，或许．．．．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,1,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

