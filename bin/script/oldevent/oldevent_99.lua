--function oldevent_99()
    instruct_1(394,15,0);   --  1(1):[金花婆婆]说: 你又想做什麽？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(395,0,1);   --  1(1):[WWW]说: 晚辈斗胆向前辈讨教讨教．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(396,15,0);   --  1(1):[金花婆婆]说: 好，我们来玩玩．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(14,0,35,1) ==true then    --  6(6):战斗[14]否则跳转到:Label1
        instruct_3(-2,-2,-2,-2,100,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_17(-2,1,21,17,0);   --  17(11):修改场景贴图:当前场景层1坐标15-11
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(385,15,0);   --  1(1):[金花婆婆]说: 好小子，有你的．*真是长江後浪推前浪．**你是来救王难姑的吧，*既然打输了你，老婆婆我就*改天再寻他们的晦气．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(386,0,1);   --  1(1):[WWW]说: ＜什麽救不救人的？*我都搞糊涂了 ＞
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_56(3);   --  56(38):提高声望值3
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(387,15,0);   --  1(1):[金花婆婆]说: 看你资质挺好的，*老婆婆我不想杀你，*你走吧．
    instruct_0();   --  0(0)::空语句(清屏)
--end

