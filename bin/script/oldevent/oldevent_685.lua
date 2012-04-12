--function oldevent_685()

    if instruct_4(164,1,0) ==false then    --  4(4):是否使用物品[绿钥匙]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_17(-2,1,43,28,0);   --  17(11):修改场景贴图:当前场景层1坐标2B-1C
    instruct_0();   --  0(0)::空语句(清屏)
--end

