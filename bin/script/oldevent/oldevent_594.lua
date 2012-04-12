--function oldevent_594()
    instruct_1(2212,109,0);   --  1(1):[???]说: 公子近来可好？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(2213,0,1);   --  1(1):[WWW]说: 一切还好，谢谢王姑娘的关*心．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2214,0,1);   --  1(1):[WWW]说: 说来惭愧，在下此次来是想*麻烦王姑娘出马帮忙的．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,109,0);   --  1(1):[???]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2215,109,0);   --  1(1):[???]说: 小女子愿尽绵薄之力．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(76);   --  10(A):加入人物[王语嫣]
    instruct_37(2);   --  37(25):增加道德2
--end

