--function oldevent_636()

    if instruct_43(110,6,0) ==false then    --  43(2B):是否有物品金蛇剑是则跳转到:Label0
        instruct_1(2380,54,0);   --  1(1):[袁承志]说: 完成前两道考验後，再回来*浡泥岛上．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2381,0,1);   --  1(1):[WWW]说: 袁兄，我找到金蛇山洞了，*而且将金蛇剑给拔了出来．*我已经通过了前两道考验．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2382,54,0);   --  1(1):[袁承志]说: 很好，接下来让我看看你在*江湖上的表现．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_28(0,80,100,0,23) ==true then    --  28(1C):判断WWW品德80-100否则跳转到:Label1
        instruct_1(2383,54,0);   --  1(1):[袁承志]说: 很好，你在江湖中行走这麽*久，还能保持在正道上，很*好．*”碧血剑”一书就拿去吧．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_2(156,1);   --  2(2):得到物品[碧血剑][1]
        instruct_3(-2,-2,-2,-2,638,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        do return; end
    end    --:Label1

    instruct_1(2384,54,0);   --  1(1):[袁承志]说: 可惜呀可惜．虽然有了智慧*和勇气，但是”仁义”方面*还要加强．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,-2,-2,637,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label2
        do return; end
    end    --:Label2

    instruct_1(2385,0,1);   --  1(1):[WWW]说: 袁兄，我没什麽时间去增加*”仁义”点数了，只好得罪*了．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(101,22,0,1) ==false then    --  6(6):战斗[101]是则跳转到:Label3
        instruct_3(-2,-2,-2,-2,637,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(2387,54,0);   --  1(1):[袁承志]说: 我还是劝你多做些侠义之事*才是．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label3

    instruct_3(-2,-2,-2,-2,639,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(2386,54,0);   --  1(1):[袁承志]说: 唉！你又往邪道走近一步，*武功这麽好，为什麽不用在*正途上呢？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(156,1);   --  2(2):得到物品[碧血剑][1]
    instruct_56(2);   --  56(38):提高声望值2
--end

