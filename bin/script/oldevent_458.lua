--function oldevent_458()

    if instruct_28(0,50,100,0,5) ==true then    --  28(1C):判断WWW品德50-100否则跳转到:Label0
        instruct_1(1645,68,0);   --  1(1):[丘处机]说: 最近江湖上对你的风评还挺*不错的，希望你继续保持下*去.
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0
    instruct_1(1644,68,0);   --  1(1):[丘处机]说: 你这作恶多端的小子，老道*饶不了你．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(75,3,0,1) ==false then    --  6(6):战斗[75]是则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        do return; end
    end    --:Label1

    instruct_3(-2,-2,-2,-2,459,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
--end

