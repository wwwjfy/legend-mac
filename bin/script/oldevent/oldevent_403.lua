--function oldevent_403()
    instruct_1(1553,63,0);   --  1(1):[程英]说: 公子再次拜访，*不知有何贵事？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(11,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(1554,0,1);   --  1(1):[WWW]说: 在下途经贵府，顺道进来看*看程姑娘是否安好．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1555,63,0);   --  1(1):[程英]说: 谢谢公子的关心．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(1549,0,1);   --  1(1):[WWW]说: 那程姑娘可否与在下一游，*帮忙在下寻找那十四天书？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_28(0,65,100,6,0) ==false then    --  28(1C):判断WWW品德65-100是则跳转到:Label1
        instruct_1(1552,63,0);   --  1(1):[程英]说: 我看公子脸上泛有戾气，公*子还是多做些善事才是．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1


    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
        instruct_1(175,63,0);   --  1(1):[程英]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_1(1550,63,0);   --  1(1):[程英]说: 嗯！好吧．*反正我一人在此也是无聊，*就随公子一游吧．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(63);   --  10(A):加入人物[程英]
    instruct_37(2);   --  37(25):增加道德2
--end

