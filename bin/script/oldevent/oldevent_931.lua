--function oldevent_931()

    if instruct_11(1,0) ==false then    --  11(B):是否住宿是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(2843,0,1);   --  1(1):[WWW]说: 为了走更远的路，*适当的休息也是必须的．*我就好好的睡一觉吧！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_12();   --  12(C):住宿休息
    instruct_40(3);   --  40(28):改变主角站立方向3
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(2844,0,1);   --  1(1):[WWW]说: 一觉起来，精神十足．*走吧，继续冒险去了！
    instruct_0();   --  0(0)::空语句(清屏)
--end

