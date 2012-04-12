--function oldevent_953()
    instruct_1(2713,2,0);   --  1(1):[程灵素]说: 公子别来无恙？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(2714,0,1);   --  1(1):[WWW]说: 一切还好．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2715,0,1);   --  1(1):[WWW]说: 没有灵姑娘这个大毒枭在，*一路上都挺麻烦的，是否可*请灵姑娘再出马呢？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,2,0);   --  1(1):[程灵素]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2716,2,0);   --  1(1):[程灵素]说: 那有什麽问题．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,-1,-1,-1,-1,-1,-1,-1,-1,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(2);   --  10(A):加入人物[程灵素]
--end

