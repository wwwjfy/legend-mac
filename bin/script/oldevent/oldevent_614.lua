--function oldevent_614()
    instruct_1(2277,0,1);   --  1(1):[WWW]说: 看各位的装扮，似乎不像汉*人？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2278,87,0);   --  1(1):[???]说: 不是汉人又怎样？*我们苗人可不像你们汉人这*麽没有良心．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2279,0,1);   --  1(1):[WWW]说: 没有良心？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2280,87,0);   --  1(1):[???]说: 你们汉人只会欺骗别人的感*情，事後就一走了之．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2281,0,1);   --  1(1):[WWW]说: 谁说的！*小爷我就是天下第一痴情奇*男子．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2282,87,0);   --  1(1):[???]说: 是吗？*看你长的还不错，人又挺老*实的．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2283,0,1);   --  1(1):[WWW]说: 你们还真了解我．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2284,87,0);   --  1(1):[???]说: 好，兄弟们，我们就将这小*子抓起来，献给教主．**自从姓韦的跑掉後，教主伤*心了好一阵，就让这小子逗*教主欢心吧．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(2285,0,1);   --  1(1):[WWW]说: 不行，不行，我还有很多大*事要办，不能留在这陪你们*教主．更何况我还不知道你*们会怎麽虐待我呢！
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_6(96,3,0,0) ==false then    --  6(6):战斗[96]是则跳转到:Label0
        instruct_15(83);   --  15(F):战斗失败，死亡
        do return; end
    end    --:Label0

    instruct_3(-2,0,-2,-2,615,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [0]
    instruct_3(-2,1,-2,-2,615,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [1]
    instruct_3(-2,2,-2,-2,615,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [2]
    instruct_3(-2,3,-2,-2,615,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [3]
    instruct_3(-2,4,-2,-2,615,-1,-1,-2,-2,-2,-2,-2,-2);   --  3(3):修改事件定义:当前场景:场景事件编号 [4]
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_56(1);   --  56(38):提高声望值1
--end

