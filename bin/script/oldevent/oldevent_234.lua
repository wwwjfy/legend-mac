--function oldevent_234()

    if instruct_4(174,1,0) ==false then    --  4(4):是否使用物品[银两]？是则跳转到:Label0
        do return; end
    end    --:Label0


    if instruct_31(10,6,0) ==false then    --  31(1F):判断银子是否够10是则跳转到:Label1
        instruct_1(790,106,0);   --  1(1):[???]说: 客倌，你别开玩笑了，*烧刀子一壶可是要*１０两银子的！
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_32(174,-10);   --  32(20):物品[银两]+[-10]
    instruct_1(791,106,0);   --  1(1):[???]说: 客倌，你慢用，
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(194,1);   --  2(2):得到物品[烧刀子][1]
    instruct_3(-2,-2,-2,-2,246,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
--end

