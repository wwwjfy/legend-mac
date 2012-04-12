--function oldevent_492()
    instruct_1(1745,0,1);   --  1(1):[WWW]说: 段兄，你在这过的还好吧？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_16(76,6,0) ==false then    --  16(10):队伍是否有[王语嫣]是则跳转到:Label0
        instruct_1(1749,53,0);   --  1(1):[段誉]说: 能天天在这陪着神仙姊姊，*要我做牛做马我都愿意．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(1746,53,0);   --  1(1):[段誉]说: 兄弟，让我加入你吧，*我想跟王姑娘在一起．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label1
        instruct_1(1748,0,1);   --  1(1):[WWW]说: 很抱歉，段兄．*王姑娘的风采也挺令小弟着*迷的．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(1747,0,1);   --  1(1):[WWW]说: 段兄你真是个痴情种子，*我们当然是一起走喽！
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
        instruct_1(175,53,0);   --  1(1):[段誉]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(53);   --  10(A):加入人物[段誉]
--end

