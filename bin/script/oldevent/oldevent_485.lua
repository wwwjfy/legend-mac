--function oldevent_485()

    if instruct_16(53,6,0) ==false then    --  16(10):队伍是否有[段誉]是则跳转到:Label0
        instruct_1(1691,0,1);   --  1(1):[WWW]说: 这雕像中的女子倒也美丽．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(1692,53,1);   --  1(1):[段誉]说: 神仙姊姊，你吩咐我朝午晚*三次练功，段誉不敢有违．
    instruct_0();   --  0(0)::空语句(清屏)
--end

