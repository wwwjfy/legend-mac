--function oldevent_286()
    instruct_1(962,0,1);   --  1(1):[WWW]说: 请问一下，你们镳局不做生*意了吗？怎麽没半个人影．**小爷我有些珍贵的宝物还想*找你们保呢！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(963,36,0);   --  1(1):[林平之]说: 这位公子，非常抱歉，*今天本镳局不做生意．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(964,0,1);   --  1(1):[WWW]说: 开了镳局却不做生意，你这*”福威镳局”的招牌是挂假*的啊！叫你们总镳头出来．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(965,36,0);   --  1(1):[林平之]说: 说不保镳就不保镳，*你在这大呼小叫个什麽劲．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(48,3,0,0) ==false then    --  6(6):战斗[48]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(966,0,1);   --  1(1):[WWW]说: 我看福威镳局的武功也稀松*平常，镳还是不要给你们保*比较妥当．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(967,36,0);   --  1(1):[林平之]说: 哼！要不是我福威镳局被青*城派的人大举入侵，家父被*抓，家母被杀，其他的镳师*死的死，逃的逃，否则．．*．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(968,0,1);   --  1(1):[WWW]说: 这麽惨？你们是走失了人家*的镳，还是怎麽样得罪了青*城派．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(969,36,0);   --  1(1):[林平之]说: 听我父亲说，先祖林远图曾*打败过青城派掌门长青子，*所以今天他们是来报复的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(970,0,1);   --  1(1):[WWW]说: 怎麽如此可恶，小爷我看不*过去了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(971,36,0);   --  1(1):[林平之]说: 少侠武功高强，请少侠帮我*救出家父，我林平之这辈子*愿做牛做马服侍你．*若少侠愿意帮忙，我福威镖*局中的任何物品，少侠都可*随意取用．*这其中还包括了一本”松风*剑谱”，是我从青城派那几*个小贼身上偷来的．想研究*看看他们的剑招上是不是有*什麽破绽．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(972,0,1);   --  1(1):[WWW]说: 说这麽多做什麽，我就帮你*上青城派看看好了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,-2,-2,298,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,2,-2,-2,-1,-1,299,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]

    if instruct_55(3,-1,14,0) ==false then    --  55(37):事件d*编号3是否为-1是则跳转到:Label1
        instruct_3(-2,3,-2,-2,948,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    end    --:Label1


    if instruct_55(4,-1,14,0) ==false then    --  55(37):事件d*编号4是否为-1是则跳转到:Label2
        instruct_3(-2,4,-2,-2,949,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    end    --:Label2

    instruct_3(36,0,-2,-2,293,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[青城派]:场景事件编号 [0]
    instruct_3(36,1,-2,-2,293,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[青城派]:场景事件编号 [1]
    instruct_3(36,2,-2,-2,293,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[青城派]:场景事件编号 [2]
    instruct_3(36,3,-2,-2,293,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[青城派]:场景事件编号 [3]
    instruct_3(36,4,-2,-2,295,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[青城派]:场景事件编号 [4]
    instruct_3(1,11,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:场景[河洛客栈]:场景事件编号 [11]
    instruct_3(1,12,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:场景[河洛客栈]:场景事件编号 [12]
    instruct_3(1,13,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:场景[河洛客栈]:场景事件编号 [13]
    instruct_3(1,14,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:场景[河洛客栈]:场景事件编号 [14]
    instruct_56(1);   --  56(38):提高声望值1
    instruct_8(3);   --  8(8):切换大地图音乐
--end

