--function oldevent_308()
    instruct_1(1073,29,0);   --  1(1):[田伯光]说: 怎麽，还想杀我吗？*还是想跟我学几招对付女人*呀？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(0,52) ==true then    --  5(5):是否选择战斗？否则跳转到:Label0
        instruct_1(1059,0,1);   --  1(1):[WWW]说: 你这采花淫贼，*死到临头还不觉悟．*你受死吧！
        instruct_0();   --  0(0)::空语句(清屏)

        if instruct_6(53,3,0,0) ==false then    --  6(6):战斗[53]是则跳转到:Label1
            instruct_15(83);   --  15(F):战斗失败，死亡
            do return; end
        end    --:Label1

        instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_3(30,0,-2,-2,303,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[平一指居]:场景事件编号 [0]
        instruct_17(-2,1,17,15,2674);   --  17(11):修改场景贴图:当前场景层1坐标11-F
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_56(4);   --  56(38):提高声望值4
        do return; end
    end    --:Label0

    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(0,42) ==true then    --  9(9):是否要求加入?否则跳转到:Label2
        instruct_1(1060,0,1);   --  1(1):[WWW]说: 这可是你说的，*我们就一起走吧，*到时可得传授小弟几招．
        instruct_0();   --  0(0)::空语句(清屏)

        if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label3
            instruct_1(175,29,0);   --  1(1):[田伯光]说: 你的队伍已满，*我无法加入．
            instruct_0();   --  0(0)::空语句(清屏)
            do return; end
        end    --:Label3

        instruct_14();   --  14(E):场景变黑
        instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_17(-2,1,17,15,2674);   --  17(11):修改场景贴图:当前场景层1坐标11-F
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_10(29);   --  10(A):加入人物[田伯光]
        instruct_37(-6);   --  37(25):增加道德-6
        do return; end
    end    --:Label2

    instruct_1(1061,0,1);   --  1(1):[WWW]说: 你们俩的事，我不想管．
    instruct_0();   --  0(0)::空语句(清屏)
--end

