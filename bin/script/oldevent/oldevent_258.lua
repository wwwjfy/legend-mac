--function oldevent_258()

    if instruct_4(178,1,0) ==false then    --  4(4):是否使用物品[刘仲甫呕血棋谱]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(840,33,0);   --  1(1):[黑白子]说: 这．．．这是．．．．*我在前人笔记之中见过这记*载．．．．*上面说刘仲甫是当时国手，*却在骊山麓给一个乡下老媪*杀得大败，登时呕血数升，*那局棋谱便称”呕血谱”．***原想只道是个传闻，怎料世*上竟然真有这局呕血谱？**少侠，*可否借老夫抄录副本．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(841,0,1);   --  1(1):[WWW]说: 哈！哈！***这”呕血棋谱”是我费尽千*辛万苦才得来的，看一次五*千万两黄金，看不看随你．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(842,31,0);   --  1(1):[丹青生]说: 二哥你瞧，这小子就是这德*性，完全没把我们梅庄放在*眼里，*先前还说梅庄中没人是他的*对手，嚣张极了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(843,33,1);   --  1(1):[黑白子]说: 少侠，别敬酒不吃吃罚酒，*我黑白子想要的东西从来没*有得不到的，*你还是乖乖地交出来吧．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(844,32,0);   --  1(1):[秃笔翁]说: 二哥，别跟他多说废话，*咱们三人联手，*量他插翅也难飞．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(845,0,1);   --  1(1):[WWW]说: 枉费梅庄在江湖上的声名如*此响亮，想不到尽是一群倚*多欺少之辈，可笑可笑．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(846,33,0);   --  1(1):[黑白子]说: 三弟，四弟，咱们梅庄可别*让这个家伙瞧扁了，就让我*来会一会，看他多大能耐．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(45,3,0,0) ==false then    --  6(6):战斗[45]是则跳转到:Label1
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(847,0,1);   --  1(1):[WWW]说: 我就说嘛，你们这几个老头*子根本就不够看，我瞧啊，*那什麽大庄主想必也没什麽*料．不过既然来了，就把他*叫出和我比划比划．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(848,33,0);   --  1(1):[黑白子]说: 臭小子！有种别跑！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,9,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [9]
    instruct_3(-2,10,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [10]
    instruct_3(-2,11,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [11]
    instruct_17(-2,1,37,34,0);   --  17(11):修改场景贴图:当前场景层1坐标25-22
    instruct_3(-2,16,1,1,-1,-1,-1,6064,6064,6064,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [16]
    instruct_3(-2,17,1,1,-1,-1,-1,6060,6060,6060,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [17]
    instruct_3(-2,18,1,1,-1,-1,-1,6046,6046,6046,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [18]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_56(3);   --  56(38):提高声望值3
--end

