--function oldevent_707()

    if instruct_4(186,1,0) ==false then    --  4(4):是否使用物品[智慧果]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(186,-1);   --  32(20):物品[智慧果]+[-1]
    instruct_1(2607,73,0);   --  1(1):[南贤]说: 通常医者对於受伤患者都可*进行医疗，但如果患者受伤*情形太严重，超过你的医疗*能力时，由医者所进行的医*疗行为将会失效．因为医者*已无能力治疗他了．*这时就只能先靠药物治疗，*待降低其受伤程度後，再行*医疗行为．*所以你平时最好多准备一些*药丸，不管是别人送的，或*是自己自行制造皆可．*不过，最好的还是即早治疗*才是预防的好方法，不要等*到病入膏肓时就来不及了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_26(-2,0,0,1,0);   --  26(1A):增加场景事件编号的三个触发事件编号
--end

