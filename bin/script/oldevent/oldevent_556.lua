--function oldevent_556()
    instruct_1(2081,45,0);   --  1(1):[薛慕华]说: 少侠有什麽吩咐？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(2084,0,1);   --  1(1):[WWW]说: 没什麽事，我路过这里，进*来看看你．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0


    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,45,0);   --  1(1):[薛慕华]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2082,0,1);   --  1(1):[WWW]说: 你的医术很高明，就加入我*的队伍，日後也能帮我们治*病疗伤．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2083,45,0);   --  1(1):[薛慕华]说: 是．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(45);   --  10(A):加入人物[薛慕华]
--end

