--function oldevent_993()
    instruct_1(2813,59,0);   --  1(1):[小龙女]说: 公子近来无恙？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(2814,0,1);   --  1(1):[WWW]说: 托龙姑娘的福，一切还好．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2815,0,1);   --  1(1):[WWW]说: 还好，不过是否能再请龙姑*娘出马帮忙呢？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,59,0);   --  1(1):[小龙女]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2816,59,0);   --  1(1):[小龙女]说: 好的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,-1,-1,-1,-1,-1,-1,-1,-1,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(59);   --  10(A):加入人物[小龙女]
--end

