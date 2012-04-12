--function oldevent_495()
    instruct_1(1792,109,0);   --  1(1):[???]说: 公子有什麽事吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(1796,0,1);   --  1(1):[WWW]说: 没事，姑娘真是美丽．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(1793,0,1);   --  1(1):[WWW]说: 听说姑娘武学渊博，不知是*否能於在下旅程中，给予一*些指导．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_16(51,6,0) ==false then    --  16(10):队伍是否有[慕容复]是则跳转到:Label1
        instruct_1(1795,109,0);   --  1(1):[???]说: 我要留下来陪我表哥．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1


    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
        instruct_1(175,109,0);   --  1(1):[???]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_1(1794,109,0);   --  1(1):[???]说: 既然我表哥都加入了，我当*然要伴着他．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(76);   --  10(A):加入人物[王语嫣]
    instruct_37(1);   --  37(25):增加道德1
--end

