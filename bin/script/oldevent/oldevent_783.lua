--function oldevent_783()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2683,74,0);   --  1(1):[北丑]说: 你知道吗？有很多古人死去*时会将生平喜爱的东西拿去*陪葬．*所以如果你想找些年代久远*的古董，可试着去盗墓．**不过别忘了带家伙去．*好比”铁铲”就是个不错的*工具．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,1,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

