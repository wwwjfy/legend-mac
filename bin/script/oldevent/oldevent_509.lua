--function oldevent_509()
    instruct_1(1827,96,0);   --  1(1):[???]说: 施主若要进入寺内，还请将*兵刃留下，待离寺时再归还*予你．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1828,0,1);   --  1(1):[WWW]说: 抱歉，恕难从命．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(80,13,0,1) ==false then    --  6(6):战斗[80]是则跳转到:Label0
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(1824,96,0);   --  1(1):[???]说: 请施主下山．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1822,0,1);   --  1(1):[WWW]说: 可是我还是想进去看看，*对不住了．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_3(-2,7,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [7]
    instruct_3(-2,8,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [8]
    instruct_3(-2,9,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [9]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_56(2);   --  56(38):提高声望值2
--end

