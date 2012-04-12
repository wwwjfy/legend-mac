--function oldevent_100()
    instruct_1(394,15,0);   --  1(1):[金花婆婆]说: 你又想做什麽？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(395,0,1);   --  1(1):[WWW]说: 晚辈斗胆向前辈讨教讨教．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(396,15,0);   --  1(1):[金花婆婆]说: 好，我们来玩玩．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(132,0,13,1) ==true then    --  6(6):战斗[132]否则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(397,15,0);   --  1(1):[金花婆婆]说: 小子，过些时候，*我金花婆婆再向你讨教．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(398,0,1);   --  1(1):[WWW]说: 我会等您的．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(387,15,0);   --  1(1):[金花婆婆]说: 看你资质挺好的，*老婆婆我不想杀你，*你走吧．
    instruct_0();   --  0(0)::空语句(清屏)
--end

