--function oldevent_593()

    if instruct_16(76,0,48) ==true then    --  16(10):队伍是否有[王语嫣]否则跳转到:Label0
        instruct_1(2209,53,0);   --  1(1):[段誉]说: 大哥，让我也加入你，*好不好？
        instruct_0();   --  0(0)::空语句(清屏)

        if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label1
            instruct_1(2211,0,1);   --  1(1):[WWW]说: 没关系，我还应付得来．*暂且不劳你费心．
            instruct_0();   --  0(0)::空语句(清屏)
            do return; end
        end    --:Label1

        instruct_1(2210,0,1);   --  1(1):[WWW]说: 我就知道你想跟着王姑娘，*兄弟我当然不会拆散你们．
        instruct_0();   --  0(0)::空语句(清屏)

        if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
            instruct_1(175,53,0);   --  1(1):[段誉]说: 你的队伍已满，*我无法加入．
            instruct_0();   --  0(0)::空语句(清屏)
            do return; end
        end    --:Label2

        instruct_14();   --  14(E):场景变黑
        instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_10(53);   --  10(A):加入人物[段誉]
        do return; end
    end    --:Label0

    instruct_1(2204,0,1);   --  1(1):[WWW]说: 兄弟，你还真会享福．*躲在洞中过着清幽的生活．**那像我，还得在外东奔西走*的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2205,53,0);   --  1(1):[段誉]说: 大哥，近来一切可好吧？*有没有什麽我可以效劳的．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label3
        instruct_1(2206,0,1);   --  1(1):[WWW]说: 没什麽问题，我还应付得来．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label3

    instruct_1(2207,0,1);   --  1(1):[WWW]说: 不瞒兄弟，此次我就是特地*来找兄弟帮忙的．*只是怕扰了兄弟的清静．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label4
        instruct_1(175,53,0);   --  1(1):[段誉]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label4

    instruct_1(2208,53,0);   --  1(1):[段誉]说: 那的话．兄弟能有今天，还*不是靠大哥帮忙的吗？**今日大哥既然有难，兄弟我*当然义不容辞的帮你了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(53);   --  10(A):加入人物[段誉]
    instruct_37(2);   --  37(25):增加道德2
--end

