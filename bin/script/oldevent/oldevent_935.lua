--function oldevent_935()

    if instruct_4(189,1,0) ==false then    --  4(4):是否使用物品[武林帖]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(2848,81,0);   --  1(1):[???]说: 武林大会即将展开，请少侠*赶快进场．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
--end

