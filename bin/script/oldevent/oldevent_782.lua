--function oldevent_782()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2682,74,0);   --  1(1):[北丑]说: 崑仑山脉中有个山洞，里面*有只千年冰蚕，可让练毒者*毒力大增．*地点在（１２，９４４）．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,1,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

