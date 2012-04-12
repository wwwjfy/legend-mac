--function oldevent_173()
    instruct_1(753,21,0);   --  1(1):[定闲]说: 阁下又来我恒山派做什麽？*我定闲可是不承认这五岳派*的．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(754,0,1);   --  1(1):[WWW]说: 好啊，你居然不承认我五岳*派，看来得再教训教训你．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(39,3,0,0) ==false then    --  6(6):战斗[39]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_37(-1);   --  37(25):增加道德-1
--end

