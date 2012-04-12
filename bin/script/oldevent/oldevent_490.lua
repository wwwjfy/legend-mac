--function oldevent_490()
    instruct_1(1738,0,1);   --  1(1):[WWW]说: 王姑娘你好．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_16(53,1,0) ==false then    --  16(10):队伍是否有[段誉]是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(1739,53,1);   --  1(1):[段誉]说: 神仙姊姊．．．*神仙姊姊．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1740,109,0);   --  1(1):[???]说: ．．．．．．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_16(53,1,0) ==false then    --  16(10):队伍是否有[段誉]是则跳转到:Label1
        do return; end
    end    --:Label1

    instruct_3(-2,0,-2,-2,-1,-1,491,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [0]
--end

