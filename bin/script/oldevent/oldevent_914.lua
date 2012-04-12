--function oldevent_914()

    if instruct_4(165,1,0) ==false then    --  4(4):是否使用物品[蓝钥匙]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_3(-2,-2,-2,-2,-1,-1,-1,2608,2608,2608,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(39,1);   --  2(2):得到物品[紫霞秘笈][1]
    instruct_2(5,5);   --  2(2):得到物品[玉真散][5]
    instruct_2(186,2);   --  2(2):得到物品[智慧果][2]
    instruct_2(99,5);   --  2(2):得到物品[菩提子][5]
    instruct_2(170,1);   --  2(2):得到物品[金钥匙][1]

    if instruct_16(35,0,1) ==true then    --  16(10):队伍是否有[令狐冲]否则跳转到:Label1
        do return; end
    end    --:Label1

    instruct_37(-1);   --  37(25):增加道德-1
--end

