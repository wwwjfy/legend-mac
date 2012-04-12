--function oldevent_72()
    instruct_1(251,9,0);   --  1(1):[张无忌]说: 你能带我去找义父吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(11,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label0
        instruct_1(249,0,1);   --  1(1):[WWW]说: 这恐怕不行，*我还有许多要事在身，*无法带你去找他．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(250,9,0);   --  1(1):[张无忌]说: ．．．．．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(247,0,1);   --  1(1):[WWW]说: 好啊，我就带你去找他．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label1
        instruct_1(175,9,0);   --  1(1):[张无忌]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(248,9,0);   --  1(1):[张无忌]说: 谢谢这位大哥．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,-1,-1,-1,-1,-1,-1,-1,-1,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(9);   --  10(A):加入人物[张无忌]
    instruct_37(2);   --  37(25):增加道德2
--end

