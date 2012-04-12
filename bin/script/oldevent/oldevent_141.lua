--function oldevent_141()
    instruct_1(541,7,0);   --  1(1):[何太冲]说: 不知少侠光临我三圣坳有何*贵事？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(11,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        instruct_1(544,0,1);   --  1(1):[WWW]说: 我是来叮咛你的，*以後要跟明教和平相处哦！*不要再互相残杀了．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(545,7,0);   --  1(1):[何太冲]说: 哼！
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(542,0,1);   --  1(1):[WWW]说: 我想找你练练功，*赚些经验点数．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(543,7,0);   --  1(1):[何太冲]说: 哼！那就来吧．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(19,3,0,0) ==false then    --  6(6):战斗[19]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(613,0,1);   --  1(1):[WWW]说: 嗯，这经验点数还真好赚．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_37(-1);   --  37(25):增加道德-1
--end

