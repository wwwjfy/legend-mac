--function oldevent_567()
    instruct_27(8,6420,6448);   --  27(1B):显示动画
    instruct_1(2147,0,1);   --  1(1):[WWW]说: 哇！鳄鱼！
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(89,3,0,0) ==false then    --  6(6):战斗[89]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,8,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [8]
    instruct_17(-2,0,31,30,358);   --  17(11):修改场景贴图:当前场景层0坐标1F-1E
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_56(1);   --  56(38):提高声望值1
--end

