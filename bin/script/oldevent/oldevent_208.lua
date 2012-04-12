--function oldevent_208()
    instruct_1(747,22,0);   --  1(1):[左冷禅]说: 小兄弟，我看你武功不错，*你我二人一起称霸这江湖，*如何？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(748,0,1);   --  1(1):[WWW]说: 你武功那麽差，*我看你还是安份一点．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(749,22,0);   --  1(1):[左冷禅]说: 上回是老朽是太轻敌了，*你还想试试看吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0


    if instruct_6(38,3,0,0) ==false then    --  6(6):战斗[38]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
--end

