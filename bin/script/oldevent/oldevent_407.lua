--function oldevent_407()

    if instruct_4(124,1,0) ==false then    --  4(4):是否使用物品[玉蜂浆]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(124,-1);   --  32(20):物品[玉蜂浆]+[-1]
    instruct_1(1389,0,1);   --  1(1):[WWW]说: 老前辈，我看这蜜蜂很难驯*养哦！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1390,64,0);   --  1(1):[周伯通]说: 没什麽的，再过一阵子我就*会让这百花谷中到处都是蜜*蜂飞舞．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1391,0,1);   --  1(1):[WWW]说: 我这有罐玉蜂浆，你拿去试*看看，会不会比较好用．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,-2,-2,-2,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,2,-2,-2,-1,-1,408,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_3(-2,3,-2,-2,-1,-1,408,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
--end

