--function oldevent_93()
    instruct_1(359,16,0);   --  1(1):[胡青牛]说: 还不快滚．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_16(9,1,0) ==false then    --  16(10):队伍是否有[张无忌]是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_1(347,9,1);   --  1(1):[张无忌]说: 胡伯伯，你忘记我啦？*我是无忌啊，武当张翠山的*後人，张无忌啊！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(348,16,0);   --  1(1):[胡青牛]说: 你是无忌！长这麽大了？*你看起来气色很好，*身上的寒毒好了吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(349,9,1);   --  1(1):[张无忌]说: 是啊！*我在崑仑山中的一番奇遇，*将身上的寒毒都治好了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(350,16,0);   --  1(1):[胡青牛]说: 那很好，那很好．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(351,9,1);   --  1(1):[张无忌]说: 师母呢？*怎麽没看到她？*她还好吧？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(352,16,0);   --  1(1):[胡青牛]说: 你师母她．．．她．．．*她被金花婆婆捉走了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(353,9,1);   --  1(1):[张无忌]说: 金花婆婆？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(354,16,0);   --  1(1):[胡青牛]说: 多年以前，因为某种缘故，*我没有医治一位银叶先生，*後来听说他病逝了．*几天以前，他的妻子金花婆*婆来到蝴蝶谷中，将你师母*给抓走了，*她说，要让我夫妇俩也嚐嚐*生离死别的痛苦．**唉，只怪我当初没能救了银*叶先生．如今，武功又低，*打不过她．*你师母不知现在怎麽了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(355,9,1);   --  1(1):[张无忌]说: 胡伯伯，不要紧，*我这位大哥武功高强，*我们这就去将师母救出来．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(356,0,1);   --  1(1):[WWW]说: 是嘛！这不过小事一桩，*包在我身上．你知道这金*花婆婆住在那吗？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(357,16,0);   --  1(1):[胡青牛]说: 似乎是住在东海的小岛上，*叫什麽灵蛇岛的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(358,0,1);   --  1(1):[WWW]说: 好，看我来个大闹灵蛇岛．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_3(-2,-2,-2,-2,94,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_3(73,1,-2,-2,104,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[灵蛇岛]:场景事件编号 [1]
    instruct_3(73,0,-2,-2,101,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:场景[灵蛇岛]:场景事件编号 [0]
    instruct_8(3);   --  8(8):切换大地图音乐
--end

