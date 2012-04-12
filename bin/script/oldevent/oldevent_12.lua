--function oldevent_12()
    instruct_1(33,0,1);   --  1(1):[WWW]说: 胡大哥，我知道苗人凤的下*落，而关於你们之间的恩怨*是如此如此这般这般．．．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(1,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(34,0,1);   --  1(1):[WWW]说: 胡大哥是否肯随我一走？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,1,0);   --  1(1):[胡斐]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(30,1,0);   --  1(1):[胡斐]说: 好．我就随你一走．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(35,0,1);   --  1(1):[WWW]说: 胡大哥肯随我一走，*那再好也不过了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,-1,-1,-1,-1,-1,-1,-1,-1,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(1);   --  10(A):加入人物[胡斐]
    instruct_37(1);   --  37(25):增加道德1
--end

