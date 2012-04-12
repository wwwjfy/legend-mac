--function oldevent_179()
    instruct_1(756,0,1);   --  1(1):[WWW]说: 天门老道，近来可好？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(757,23,0);   --  1(1):[天门]说: 哼！你来做什麽．*是不是岳不群派你来的，*显显他五岳派掌门的威风．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(758,0,1);   --  1(1):[WWW]说: 听你的口气似乎很不服气，*我们就再来玩玩．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(40,3,0,0) ==false then    --  6(6):战斗[40]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_37(-1);   --  37(25):增加道德-1
--end

