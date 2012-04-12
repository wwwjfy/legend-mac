--function oldevent_569()
    instruct_1(2140,0,1);   --  1(1):[WWW]说: 徒儿，师父来看你了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2141,44,0);   --  1(1):[岳老三]说: ．．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2142,0,1);   --  1(1):[WWW]说: 叫师父啊．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2143,44,0);   --  1(1):[岳老三]说: ．．．师．．师父．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(2146,0,1);   --  1(1):[WWW]说: 记得要乖哦！
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2144,0,1);   --  1(1):[WWW]说: 徒儿，你就跟为师的走吧．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,44,0);   --  1(1):[岳老三]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2145,44,0);   --  1(1):[岳老三]说: 是．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(44);   --  10(A):加入人物[岳老三]
--end

