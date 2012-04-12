--function oldevent_224()
    instruct_1(761,0,1);   --  1(1):[WWW]说: 莫大先生，近来可好？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(762,20,0);   --  1(1):[莫大]说: 小兄弟，我看你本质不差，*给你一点忠告：*对岳掌门要小心点．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(763,0,1);   --  1(1):[WWW]说: 你说什麽？是不是不服气岳*先生当上五岳派的掌门．*看来得再给你点苦头吃吃．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(41,3,0,0) ==false then    --  6(6):战斗[41]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_37(-1);   --  37(25):增加道德-1
--end

