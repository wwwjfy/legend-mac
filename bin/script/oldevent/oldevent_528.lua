--function oldevent_528()
    instruct_1(1939,50,0);   --  1(1):[乔峰]说: 怎麽，你准备好了吗？
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(11,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        instruct_1(1943,0,1);   --  1(1):[WWW]说: 嗯，还没．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1944,50,0);   --  1(1):[乔峰]说: 乔某随时在此等候少侠．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(1940,0,1);   --  1(1):[WWW]说: 在下特来领教乔大侠的*”降龙十八掌”．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(83,8,0,1) ==false then    --  6(6):战斗[83]是则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(1942,50,0);   --  1(1):[乔峰]说: 你还不行，再回去苦练吧．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(1941,50,0);   --  1(1):[乔峰]说: 少侠经这多日来的修练，武*功果然不凡，乔某拜服．*”天龙八部”你就拿去吧．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2198,0,1);   --  1(1):[WWW]说: 那里，乔帮主承让了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(147,1);   --  2(2):得到物品[天龙八部][1]
    instruct_3(-2,-2,-2,-2,529,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,20,-2,-2,-1,-1,530,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [20]
    instruct_3(-2,21,-2,-2,-1,-1,530,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [21]

    if instruct_43(183,1,0) ==false then    --  43(2B):是否有物品带头大哥书信是则跳转到:Label2
        do return; end
    end    --:Label2

    instruct_3(28,12,-2,-2,518,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[少林寺]:场景事件编号 [12]
    instruct_37(12);   --  37(25):增加道德12
    instruct_56(15);   --  56(38):提高声望值15
--end

