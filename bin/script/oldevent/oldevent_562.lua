--function oldevent_562()

    if instruct_16(47,6,0) ==false then    --  16(10):队伍是否有[阿紫]是则跳转到:Label0
        instruct_1(2120,48,0);   --  1(1):[游坦之]说: 你别在这惹阿紫姑娘生气．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2127,48,0);   --  1(1):[游坦之]说: 阿紫姑娘，你别丢下我一个*人．**求求少侠让我加入，好让我*跟在阿紫姑娘身旁服侍她．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(1,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label1
        do return; end
    end    --:Label1

    instruct_1(2128,0,1);   --  1(1):[WWW]说: 也好．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
        instruct_1(175,48,0);   --  1(1):[游坦之]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,4,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(48);   --  10(A):加入人物[游坦之]
    instruct_37(-2);   --  37(25):增加道德-2
--end

