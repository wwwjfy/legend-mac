--function oldevent_1002()

    if instruct_4(145,1,0) ==false then    --  4(4):是否使用物品[雪山飞狐]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(145,-1);   --  32(20):物品[雪山飞狐]+[-1]
    instruct_3(-2,-2,-2,-2,-1,-1,-1,4664,4664,4664,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_61(1,0) ==false then    --  61(3D):判断是否放完14本书是则跳转到:Label1
        do return; end
    end    --:Label1

    instruct_67(23);   --  67(43):播放音效23
    instruct_1(2914,0,1);   --  1(1):[WWW]说: 咦！好像有什麽声音．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_17(-2,1,18,25,0);   --  17(11):修改场景贴图:当前场景层1坐标12-19
    instruct_17(-2,1,18,26,0);   --  17(11):修改场景贴图:当前场景层1坐标12-1A
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
--end

