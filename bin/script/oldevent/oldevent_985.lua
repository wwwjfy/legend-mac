--function oldevent_985()
    instruct_1(2793,51,0);   --  1(1):[慕容复]说: 怎麽？想通了．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(2794,0,1);   --  1(1):[WWW]说: 不行，我不能这麽做．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(2795,0,1);   --  1(1):[WWW]说: 好，就听你的．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,51,0);   --  1(1):[慕容复]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(2796,51,0);   --  1(1):[慕容复]说: 走．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,-1,-1,-1,-1,-1,-1,-1,-1,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(51);   --  10(A):加入人物[慕容复]
--end

