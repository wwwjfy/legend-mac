--function oldevent_480()
    instruct_1(773,105,0);   --  1(1):[???]说: 客倌，看你一身打扮，不像*是本地人，大老远赶来，想*必旅途一定劳累了．*要不要在这住上一宿，让你*的体力，元气恢复恢复．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_11(1,0) ==false then    --  11(B):是否住宿是则跳转到:Label0
        do return; end
    end    --:Label0


    if instruct_31(50,7,0) ==false then    --  31(1F):判断银子是否够50是则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(794,105,0);   --  1(1):[???]说: 走，走，走，*没钱就不要妨碍我做生意！
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2150,0,1);   --  1(1):[WWW]说: 好，我就试试看你们高昇客*栈的服务好不好．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_12();   --  12(C):住宿休息
    instruct_32(174,-50);   --  32(20):物品[银两]+[-50]
    instruct_19(38,18);   --  19(13):主角移动至26-12
    instruct_40(3);   --  40(28):改变主角站立方向3
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
--end

