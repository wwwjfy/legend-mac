--function oldevent_97()
    instruct_1(373,17,0);   --  1(1):[王难姑]说: 少侠如果有需要的话，*尽管说出来．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(377,0,1);   --  1(1):[WWW]说: 改日如果有需要时，*我一定会来找王前辈．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(376,0,1);   --  1(1):[WWW]说: 好吧！*那就麻烦王前辈与我一起奔*波江湖了．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,17,0);   --  1(1):[王难姑]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(17);   --  10(A):加入人物[王难姑]
    instruct_37(1);   --  37(25):增加道德1
--end

