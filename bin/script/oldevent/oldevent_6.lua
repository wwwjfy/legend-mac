--function oldevent_6()
    instruct_1(20,1,0);   --  1(1):[胡斐]说: 小兄弟，再次造访，*是否练就了更高深的武功*胡某候教．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_5(1,0) ==false then    --  5(5):是否选择战斗？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(19,0,1);   --  1(1):[WWW]说: 晚辈斗胆向前辈讨教讨教．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(0,0,74,1) ==true then    --  6(6):战斗[0]否则跳转到:Label1
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_13();   --  13(D):重新显示场景
        instruct_1(9,0,1);   --  1(1):[WWW]说: 名闻天下的胡家刀法，亦不*过尔尔，江湖上所传，恐怕*言过其实了．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(10,1,0);   --  1(1):[胡斐]说: 住嘴，要不是我所得之刀谱*不全，你那接得了我十招．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(11,0,1);   --  1(1):[WWW]说: 刀谱不全？你说你使的是不*完整的胡家刀法．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(12,1,0);   --  1(1):[胡斐]说: 是的．等我寻得所失之刀谱*咱们俩再较量较量吧！
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(13,0,1);   --  1(1):[WWW]说: 那胡大哥可知”雪山飞狐”*一书之下落．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(14,1,0);   --  1(1):[胡斐]说: 只因我名字倒过来念之音为*飞狐，而且长年居住於东北*雪地里，*所以江湖上的人送给我一个*外号”雪山飞狐”．**此外号正好与人人都想争夺*的”金氏天书”其中一书名*称相同．*也正因如此，在这几年间引*来了一些武林人士的登门拜*访．*不过，我胡斐确实不知此书*的下落．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(15,0,1);   --  1(1):[WWW]说: 那告辞了，他日若有机会，*再向胡大哥请教．
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(16,1,0);   --  1(1):[胡斐]说: 等我寻得所失之刀谱，*咱们俩再较量较量吧！
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_3(-2,-2,-2,-2,3,-2,-2,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
        instruct_3(-2,1,-2,-2,-2,-2,8,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_56(1);   --  56(38):提高声望值1
        do return; end
    end    --:Label1

    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(7,1,0);   --  1(1):[胡斐]说: 不掂掂自己的份量，就敢上*我辽东胡家．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(8,0,1);   --  1(1):[WWW]说: 小弟实在有要找到书的原因*并不是大哥所想的贪求武林*秘笈的小人．*技不如人，我也不再多说，*他日再向胡大侠领教胡家刀*法．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,-2,-2,4,-2,-2,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(-2,1,-2,-2,-2,-2,9,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
--end

