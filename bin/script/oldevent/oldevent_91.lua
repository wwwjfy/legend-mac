--function oldevent_91()
    instruct_1(339,0,1);   --  1(1):[WWW]说: 好啊！成崑，*原来你躲在这里，**怎麽，几个坏蛋聚在这里，*是不是又在一起商量什麽*坏勾当？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(340,18,0);   --  1(1):[成崑]说: 哼！*上次的事全被你坏了，*我这次饶不了你．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(341,0,1);   --  1(1):[WWW]说: 手下败将还说大话，*这次得小心一点，*可别再让你跑了．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(13,3,0,0) ==false then    --  6(6):战斗[13]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_3(-2,0,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [0]
    instruct_3(-2,1,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_3(-2,2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_3(-2,3,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,4,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(342,0,1);   --  1(1):[WWW]说: 今天真是大快人心，*替武林除了一个大害．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(191,1);   --  2(2):得到物品[一颗头颅][1]
    instruct_56(5);   --  56(38):提高声望值5
--end

