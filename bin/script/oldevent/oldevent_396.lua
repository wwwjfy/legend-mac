--function oldevent_396()

    if instruct_4(134,1,0) ==false then    --  4(4):是否使用物品[断肠草]？是则跳转到:Label0
        do return; end
    end    --:Label0

    instruct_32(134,-1);   --  32(20):物品[断肠草]+[-1]
    instruct_37(4);   --  37(25):增加道德4
    instruct_1(1290,0,1);   --  1(1):[WWW]说: 杨兄，你快将这服下．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1291,58,0);   --  1(1):[杨过]说: 这是什麽？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1292,0,1);   --  1(1):[WWW]说: 这是生长在情花丛旁的断肠*草．**我曾听人说过，凡毒蛇出没*之处，七步之内必有解毒之*药，其他毒物，无不如此．*这是天地间万物相生相克的*至理．**这断肠草正好生长在情花树*旁，虽说此草具有剧毒，但*我反覆思量，此草以毒攻毒*正是情花的对头克星．***服这毒草自是冒极大险，但*反正已无药可救，咱们就死*马当活马医，试它一试．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1293,58,0);   --  1(1):[杨过]说: 好，我便服这断肠草试试，*倘若无效，十六年後，请少*侠告知我那苦命的妻子罢！
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1294,58,0);   --  1(1):[杨过]说: ．．．啊．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1295,0,1);   --  1(1):[WWW]说: 杨兄怎麽了？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1296,58,0);   --  1(1):[杨过]说: ．．．．．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,-2,-2,397,-1,-1,6186,6186,6186,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_1(1297,58,0);   --  1(1):[杨过]说: 我杨某这条命是少侠你救回*来的．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1298,0,1);   --  1(1):[WWW]说: 你身上的毒质当真都解了？*还好还好，我刚真捏了把冷*汗．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1299,58,0);   --  1(1):[杨过]说: 这次真谢谢少侠的帮忙，*让杨某从鬼门关回来．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1300,0,1);   --  1(1):[WWW]说: 不知杨兄今後有何打算？
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(1301,58,0);   --  1(1):[杨过]说: 我也不知道，但总是要保持*着健康，待十六年後与我妻*子相见．*对了，我这里有瓶玉蜂浆，*就送给兄台好了．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_2(124,1);   --  2(2):得到物品[玉蜂浆][1]
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_9(6,0) ==false then    --  9(9):是否要求加入?是则跳转到:Label1
        instruct_1(1304,0,1);   --  1(1):[WWW]说: 那杨兄就好好休养吧，过些*时候我再来看你．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label1

    instruct_1(1302,0,1);   --  1(1):[WWW]说: 不知杨兄是否有意与我为伴*云游各地，一览这五岳三川*的风貌．
    instruct_0();   --  0(0)::空语句(清屏)

    if instruct_20(0,6) ==true then    --  20(14):队伍是否满？否则跳转到:Label2
        instruct_1(175,58,0);   --  1(1):[杨过]说: 你的队伍已满，*我无法加入．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label2

    instruct_1(1303,58,0);   --  1(1):[杨过]说: 好啊！或许旅途中会有龙儿*的下落也说不定．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_14();   --  14(E):场景变黑
    instruct_3(-2,-2,0,0,-1,-1,-1,-1,-1,-1,-2,-2,-2);   --  3(3):修改事件定义:当前场景:当前场景事件编号
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_13();   --  13(D):重新显示场景
    instruct_10(58);   --  10(A):加入人物[杨过]
    instruct_37(3);   --  37(25):增加道德3
--end

