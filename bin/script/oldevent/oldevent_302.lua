--function oldevent_302()

    if instruct_16(29,0,32) ==true then    --  16(10):队伍是否有[田伯光]否则跳转到:Label0
        instruct_1(1062,28,0);   --  1(1):[平一指]说: 田伯光！你这恶贼，*我跟你拼了！
        instruct_0();   --  0(0)::空语句(清屏)

        if instruct_6(52,3,0,0) ==false then    --  6(6):战斗[52]是则跳转到:Label1
            instruct_15(83);   --  15(F):战斗失败，死亡
            do return; end
        end    --:Label1

        instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_37(-5);   --  37(25):增加道德-5
        do return; end
    end    --:Label0

    instruct_1(1040,28,0);   --  1(1):[平一指]说: 你还在这做什麽？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1041,0,1);   --  1(1):[WWW]说: 没事逛逛．
    instruct_0();   --  0(0)::空语句(清屏)
--end

