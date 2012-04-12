--function oldevent_130()
    instruct_1(511,8,0);   --  1(1):[唐文亮]说: 不知少侠来我崆峒山有何贵*事？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(11,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        instruct_1(512,0,1);   --  1(1):[WWW]说: 我是来叮咛你的，*以後要跟明教和平相处哦！*不要再互相残杀了．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(513,8,0);   --  1(1):[唐文亮]说: 哼！
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(507,0,1);   --  1(1):[WWW]说: 我想找你练练功，*赚些经验点数．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(508,8,0);   --  1(1):[唐文亮]说: 哼！那就来吧．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(17,3,0,0) ==false then    --  6(6):战斗[17]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(613,0,1);   --  1(1):[WWW]说: 嗯，这经验点数还真好赚．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_37(-1);   --  37(25):增加道德-1
--end

