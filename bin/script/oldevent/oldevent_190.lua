--function oldevent_190()
    instruct_1(657,20,0);   --  1(1):[莫大]说: 小子，你擅闯我衡山，是何*用意？*莫非是左冷禅派来的奸细．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(28,3,0,0) ==false then    --  6(6):战斗[28]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_3(-2,-2,-2,-2,191,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,19,-2,-2,-1,-1,222,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [19]
    instruct_3(-2,21,-2,-2,-1,-1,222,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(658,20,0);   --  1(1):[莫大]说: 回去告诉左冷禅，下月十五*在嵩山召开的大会，我莫大*一定到场．*我倒要看看其它三派的掌门*怎麽说．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(69,1);   --  2(2):得到物品[回峰落雁剑法][1]
    instruct_56(3);   --  56(38):提高声望值3
--end

