--function oldevent_444()
    instruct_1(1556,0,1);   --  1(1):[WWW]说: 这位兄台，你家怎麽有这麽*多漂亮姊姊．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1557,61,0);   --  1(1):[欧阳克]说: 她们都是我的弟子．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1558,0,1);   --  1(1):[WWW]说: 你这师父是教什麽武功，怎*麽都收女弟子．难不成你这*儿是”妹登风”吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1559,61,0);   --  1(1):[欧阳克]说: 什麽是”妹登风”？我这里*是白驼山．我是这里的少主*欧阳克，我的弟子都是从各*地挑选出的美女，由我亲自*传授”床上功夫”．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1560,0,1);   --  1(1):[WWW]说: ＜这是限制级的游戏吗？＞*你吃的消吗？*分我几个好了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1561,61,0);   --  1(1):[欧阳克]说: 你是谁，到我白驼山撒野．*要比床上功夫前先来比一比*真武艺．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(69,3,0,0) ==false then    --  6(6):战斗[69]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(1562,0,1);   --  1(1):[WWW]说: 怎样，我的功夫比你强吧．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1563,61,0);   --  1(1):[欧阳克]说: 你知道我是谁吗．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1564,0,1);   --  1(1):[WWW]说: 你不是说了吗，你是白驼山*的少主．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1565,61,0);   --  1(1):[欧阳克]说: 那你不知道我叔父是谁吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1566,0,1);   --  1(1):[WWW]说: 是谁？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1567,61,0);   --  1(1):[欧阳克]说: 江湖上人称”西毒”的欧阳*锋．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1568,0,1);   --  1(1):[WWW]说: 听起来好像不好惹．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1569,61,0);   --  1(1):[欧阳克]说: 知道不好惹就对了．*小子，我看你功夫还不错，*这样子好了，我们可以找一*些志同道合的人，使尽各种*手段，打倒各大门派，称霸*这武林．*到时我们就可和我叔父他们*一般，闯出一番名号，让武*林中人闻之丧胆．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1570,0,1);   --  1(1):[WWW]说: 你说要不惜使用各种手段，*那行为不是太卑鄙了吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1571,61,0);   --  1(1):[欧阳克]说: 这年头你还想正正当当的？*那你要等到什麽时後才能称*霸武林．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1572,0,1);   --  1(1):[WWW]说: 我想看看．．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_56(1);   --  56(38):提高声望值1
    instruct_3(-2,-2,-2,-2,445,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,7,-2,-2,-1,-1,473,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [7]
    instruct_3(-2,8,-2,-2,-1,-1,473,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [8]

    if instruct_9(11,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label1
        instruct_1(1576,0,1);   --  1(1):[WWW]说: 不行，我还是想当个大侠，*不肖与你这个人为伍．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(1577,61,0);   --  1(1):[欧阳克]说: 真是可惜，本来还想跟你研*究研究”床上功夫”呢．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(1573,0,1);   --  1(1):[WWW]说: 好吧，那我们就一起称霸武*林吧．反正有句名言不是说*”好人早死，坏人较长命”
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_42(6,0) ==false then    --  42(2A):队伍中是否有女性是则跳转到:Label2
        instruct_1(1575,61,0);   --  1(1):[欧阳克]说: 不行，不行，*我们同伴中没有女的我会受*不了，等你找到女的再说．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2


    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label3
        instruct_1(175,61,0);   --  1(1):[欧阳克]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label3

    instruct_1(1574,61,0);   --  1(1):[欧阳克]说: 走吧，再去找一些邪恶的人*来加入．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,0,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [0]
    instruct_3(-2,1,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_3(-2,2,-2,-2,472,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_3(-2,3,-2,-2,472,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,4,-2,-2,472,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_3(-2,5,-2,-2,472,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [5]
    instruct_3(-2,6,-2,-2,472,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [6]
    instruct_3(-2,7,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [7]
    instruct_3(-2,8,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [8]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(61);   --  10(A):加入人物[欧阳克]
    instruct_37(-6);   --  37(25):增加道德-6
--end

