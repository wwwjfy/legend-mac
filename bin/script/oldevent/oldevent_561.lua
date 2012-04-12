--function oldevent_561()
    instruct_1(2123,47,0);   --  1(1):[阿紫]说: 有什麽事吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(1,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(2124,0,1);   --  1(1):[WWW]说: 我看阿紫姑娘聪明伶利，又*会毒术，所以想请阿紫姑娘*加入我．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_28(0,0,40,6,0) ==false then    --  28(1C):判断WWW品德0-40是则跳转到:Label1
        instruct_1(2126,47,0);   --  1(1):[阿紫]说: 你这人这麽正直，跟你在一*起一定挺无趣的，我才不要*呢．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1


    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
        instruct_1(175,47,0);   --  1(1):[阿紫]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_1(2125,47,0);   --  1(1):[阿紫]说: 我看你这人也不是什麽呆头*鹅，跟你一起走走也挺好玩*的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,3,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(47);   --  10(A):加入人物[阿紫]
    instruct_37(-2);   --  37(25):增加道德-2
    instruct_1(2127,48,0);   --  1(1):[游坦之]说: 阿紫姑娘，你别丢下我一个*人．**求求少侠让我加入，好让我*跟在阿紫姑娘身旁服侍她．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(1,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label3
        do return; end
    end    --:Label3

    instruct_1(2128,0,1);   --  1(1):[WWW]说: 也好．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label4
        instruct_1(175,48,0);   --  1(1):[游坦之]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label4

    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,4,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(48);   --  10(A):加入人物[游坦之]
    instruct_37(-2);   --  37(25):增加道德-2
--end

