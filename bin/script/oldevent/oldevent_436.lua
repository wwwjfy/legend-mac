--function oldevent_436()
    instruct_3(7,6,0,0,-1,-1,-1,-1,-1,-1,0,-2,-2);   --  3(3):修改事件定义:场景[山洞]:场景事件编号 [6]
    instruct_37(5);   --  37(25):增加道德5

    if instruct_16(58,0,239) ==true then    --  16(10):队伍是否有[杨过]否则跳转到:Label0
        instruct_1(1450,58,1);   --  1(1):[杨过]说: 龙儿！
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1451,59,0);   --  1(1):[小龙女]说: 过儿！
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1452,58,1);   --  1(1):[杨过]说: ．．．．．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1453,59,0);   --  1(1):[小龙女]说: ．．．．．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1454,58,1);   --  1(1):[杨过]说: 龙儿，你容貌一点也没变，*我却老了．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1455,59,0);   --  1(1):[小龙女]说: 不是老了，是我的过儿长大*了．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1458,0,1);   --  1(1):[WWW]说: 不知龙姑娘怎会在这绝情谷*底？
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1459,58,1);   --  1(1):[杨过]说: 是啊，龙儿，你不是在绝情*谷中留言，随那南海神尼走*了？
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1460,59,0);   --  1(1):[小龙女]说: 那时，我知道你为了我中毒*难治，不愿独生．我想了又*想，唯有自己先死，绝了你*的念头，才有希望化解你体*内的情花之毒．但若我露了*自尽的痕迹，只有更促你早*死．*我思量了一夜，决定用剑尖*在断肠崖前刻了那几行字，*故意定了一十六年之约，这*才纵身跃入深谷．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1461,58,1);   --  1(1):[杨过]说: 你跃入这绝情谷底，便又怎*样？
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1462,59,0);   --  1(1):[小龙女]说: 我昏昏迷迷的跌进水潭，浮*起来时给水流冲进冰窖，通*到了这里，自此便在此处过*活．这里并无禽鸟野兽，但*潭中水产丰盛，谷底水果食*之不尽．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1463,58,1);   --  1(1):[杨过]说: 真是老天有眼．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1464,0,1);   --  1(1):[WWW]说: 真是老天有眼，让我们发现*老顽童那蜜蜂上的刺字，才*得以找到这条通往谷底的小*路，让你夫妇俩团圆．那蜜*蜂上的字是龙姑娘刺上去的*吧？
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1465,59,0);   --  1(1):[小龙女]说: 是的．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1466,0,1);   --  1(1):[WWW]说: 那不知*”二午寺”，”一山恶”两*句话是什麽意思？
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1467,59,0);   --  1(1):[小龙女]说: 我在水底曾看到两组数字，*”１３２””２５４”，我*就一起刻上去了．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1468,0,1);   --  1(1):[WWW]说: ”１３２”，”２５４”？*我听老顽童念成”二午寺”*”一山恶”．唉！
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1469,58,1);   --  1(1):[杨过]说: 杨某真是亏欠兄弟太多了，*否则可能到现在，我夫妇俩*还分隔两地而无法相见．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1470,0,1);   --  1(1):[WWW]说: 不知杨兄现在有何打算．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1471,58,1);   --  1(1):[杨过]说: 我想先和龙儿回古墓中，兄*弟将来若有什麽困难，尽管*到古墓中找我夫妇俩．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1472,0,1);   --  1(1):[WWW]说: 杨兄慢走，愿你夫妇俩别再*分离．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1473,58,1);   --  1(1):[杨过]说: 那我夫妇俩先走了，祝兄弟*一路顺风．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_14();   --  14(E):场景变黑
        instruct_17(18,1,44,31,0);   --  17(11):修改场景贴图:场景[古墓]层1坐标2C-1F
        instruct_17(18,1,44,30,0);   --  17(11):修改场景贴图:场景[古墓]层1坐标2C-1E
        instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_3(18,0,1,1,438,-1,-1,6188,6188,6188,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [0]
        instruct_3(18,1,1,1,440,-1,-1,6068,6068,6068,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [1]
        instruct_3(18,2,-2,-2,442,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [2]
        instruct_3(18,3,-2,-2,442,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [3]
        instruct_3(18,4,-2,-2,443,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [4]
        instruct_3(18,5,-2,-2,443,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [5]
        instruct_33(58,24,1);   --  33(21):杨过学会武功黯然销魂掌
        instruct_41(58,61,1);   --  41(29):杨过得到物品黯然销魂掌1
        instruct_21(58);   --  21(15):[杨过]离队
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(1474,0,1);   --  1(1):[WWW]说: ”问世间情是何物，直叫人*生死相许”**他们夫妇俩真是令人羡慕的*神仙侠侣．”神仙侠侣”！*．．．．．”神鵰侠侣”？*对了，还有那头老鵰，那本*书该不会是在他俩身上吧．*　　　　*看来有空还要再前往古墓找*他夫妇俩．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(1475,0,1);   --  1(1):[WWW]说: ＜哇！这姑娘真美，好像神*  仙一般＞．姑娘不知为何*一人独自在这谷底．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1476,59,0);   --  1(1):[小龙女]说: 你是怎麽进来的？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1477,0,1);   --  1(1):[WWW]说: 那里有一条很隐密的小路通*到这谷底．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1478,59,0);   --  1(1):[小龙女]说: 在那里？*我要赶快出去找过儿．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1479,0,1);   --  1(1):[WWW]说: 过儿？*莫非姑娘说的是杨过杨兄．*请问姑娘芳名？　　　　　　　　　　　　
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1480,59,0);   --  1(1):[小龙女]说: 我是小龙女．*你见过我过儿？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1481,0,1);   --  1(1):[WWW]说: 是的．我曾与杨兄有过一面*之缘，杨兄也是非常想念龙*姑娘．*不知龙姑娘怎会在这绝情谷*底？你不是在绝情谷留言，*随那南海神尼走了？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1482,59,0);   --  1(1):[小龙女]说: 那时，我知道过儿为了我中*毒难治，不愿独生．我想了*又想，唯有自己先死，绝了*过儿的念头，才有希望化解*过儿体内的情花之毒．但若*我露了自尽的痕迹，只有更*促使过儿早死．***我思量了一夜，决定用剑尖*在断肠崖前刻了那几行字，*故意定了一十六年之约，这*才纵身跃入深谷．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1483,0,1);   --  1(1):[WWW]说: 你跃入这绝情谷底，便又怎*样？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1484,59,0);   --  1(1):[小龙女]说: 我昏昏迷迷的跌进水潭，浮*起来时给水流冲进冰窖，通*到了这里，自此便在此处过*活．这里并无禽鸟野兽，但*潭中水产丰盛，谷底水果食*之不尽．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1486,0,1);   --  1(1):[WWW]说: 真是老天有眼，让我发现了*老顽童那蜜蜂上的刺字，才*得以找到这条通往谷底的小*路，让你夫妇俩团圆．那蜜*蜂上的字是龙姑娘刺上去的*吧？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1487,59,0);   --  1(1):[小龙女]说: 是的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1488,0,1);   --  1(1):[WWW]说: 那不知*”二午寺”，”一山恶”两*句话是什麽意思？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1489,59,0);   --  1(1):[小龙女]说: 我在水底曾看到两组数字，*”１３２””２５４”，我*就一起刻上去了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1490,0,1);   --  1(1):[WWW]说: ”１３２”，”２５４”？*我听老顽童念成”二午寺”*”一山恶”．唉！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1491,59,0);   --  1(1):[小龙女]说: 过儿现在在那里？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1492,0,1);   --  1(1):[WWW]说: 杨兄现正在神鵰穴中练功休*养，那神鵰穴是在．．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1493,59,0);   --  1(1):[小龙女]说: 我这就去找他．*少侠将来有空，可到古墓中*找我夫妇．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_17(18,1,44,31,0);   --  17(11):修改场景贴图:场景[古墓]层1坐标2C-1F
    instruct_17(18,1,44,30,0);   --  17(11):修改场景贴图:场景[古墓]层1坐标2C-1E
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(7,6,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:场景[山洞]:场景事件编号 [6]
    instruct_3(18,0,1,1,438,-1,-1,6188,6188,6188,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [0]
    instruct_3(18,1,1,1,440,-1,-1,6068,6068,6068,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [1]
    instruct_3(18,2,-2,-2,442,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [2]
    instruct_3(18,3,-2,-2,442,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [3]
    instruct_3(18,4,-2,-2,443,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [4]
    instruct_3(18,5,-2,-2,443,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[古墓]:场景事件编号 [5]
    instruct_33(58,24,1);   --  33(21):杨过学会武功黯然销魂掌
    instruct_41(58,61,1);   --  41(29):杨过得到物品黯然销魂掌1
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(1474,0,1);   --  1(1):[WWW]说: ”问世间情是何物，直叫人*生死相许”**他们夫妇俩真是令人羡慕的*神仙侠侣．”神仙侠侣”！*．．．．．”神鵰侠侣”？*对了，还有那头老鵰，那本*书该不会是在他俩身上吧．*　　　　*看来有空还要再前往古墓找*他夫妇俩．
    instruct_0();   --  0(0)::空语句(清屏)
--end

