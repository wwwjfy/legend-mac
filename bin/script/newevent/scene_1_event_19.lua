

--场景1 编号为19的D*触发


--先定义本文件使用的局部函数

--当铺
--对于价格表中有价格的，则可收。没有的，如果是药品则一律以10兩的价格收。
local function Menu_Sale()
    local Price={};
	Price[0]=1600;           --醉生梦死酒
	Price[2]=1000;           --还魂液
    Price[28]=600;           --茯苓首乌丸
    Price[29]=700;           --千年灵芝
    Price[34]=500;           --千年人参
    Price[35]=800;           --天山雪莲

	Cls();
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,"请选择您要当掉的物品",C_WHITE,CC.DefaultFont);
    lib.ShowSurface();
	lib.Delay(500);

	local thing={};
    local thingnum={};

    for i = 0,CC.MyThingNum-1 do
        thing[i]=JY.Base["物品" .. i+1];
        thingnum[i]=JY.Base["物品数量" ..i+1];
    end

    local r=SelectThing(thing,thingnum);
	Cls();
    if r<0 then
	    return 0;
	end

    local value;
    if Price[r]==nil then
	    if JY.Thing[r]["类型"]==3 then
	        value=10;
		else
            DrawStrBoxWaitKey("抱歉，你这物品我们不收。",C_WHITE,CC.DefaultFont);
			Cls();
			return 0;
		end
	else
	    value=Price[r];
	end

    if DrawStrBoxYesNo(-1,-1,string.format("%s价值%s兩银子，是否当掉?",JY.Thing[r]["名称"],value),C_WHITE,CC.DefaultFont,1) == true then
        instruct_32(r,-1);                 --物品减少1
        instruct_32(CC.MoneyID,value);     --银子增加
    end
	Cls();
	return 0;
end




local function Menu_Shop()
    TalkEx("我们这里出售市面上没有的产品，欢迎选购",111,0);

	local ShopThing={ {0,2000},         --醉生梦死酒
	                  {2,1200},          --还魂液
					  {28,800},}         --茯苓首乌丸

    local menu={};
	for i=1,3 do
	    menu[i]={};
	    menu[i][1]=string.format("%-12s %5d",JY.Thing[ShopThing[i][1]]["名称"],ShopThing[i][2]);
        menu[i][2]=nil;
		menu[i][3]=1;
	end

    local r=ShowMenu(menu,3,0,CC.MainSubMenuX,CC.MainSubMenuY+CC.SingleLineHeight,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r>0 then
        if instruct_31(ShopThing[r][2])==false then
            TalkEx("非常抱歉，你身上的钱似乎不够．",111,0);
        else
            instruct_32(CC.MoneyID,-ShopThing[r][2]);     --银子减少
            instruct_32(ShopThing[r][1],1);           --物品增加
            TalkEx("欢迎下次光临！",111,0);
        end
    end

end


local function Menu_Task()
    TalkEx("欢迎光临佣兵行会，您可以选择任务",111,0);

    local menu={ {"去沙漠消灭蜘蛛怪",nil,1,61,50},    --最后两个数据为战斗编号和赢后得到的钱数
	             {"去南海杀大鳄鱼",nil,1,89,100},
				 {"去长白山打雪怪",nil,1,6,200},
				 };

    local r=ShowMenu(menu,3,0,CC.MainSubMenuX,CC.MainSubMenuY+CC.SingleLineHeight,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);

    if r>0 then
        TalkEx("祝你好运！",111,0);
		if WarMain(menu[r][4],1)==true then
		    instruct_13();
            DrawStrBoxWaitKey(string.format("您的战斗胜利，获得%d兩银子！",menu[r][5]),C_WHITE,CC.DefaultFont);
            instruct_32(CC.MoneyID,menu[r][5]);     --银子减少
		else
		    instruct_13();
            DrawStrBoxWaitKey("战斗失败，抱歉没有银子可挣！",C_WHITE,CC.DefaultFont);
		end
	end

    Cls();

end



--去其他客栈
local function Menu_Go()
    TalkEx("您可以选择要去的客栈。",111,0);
    local Address={ {3,21,50},           --依次为场景id，出现在场景的XY坐标。注意这个坐标必须是空地。
	                {40,26,43},
					{60,26,42},
                    {61,23,49}, };

    local menu={};
	for i=1,4 do
	    menu[i]={ JY.Scene[Address[i][1]]["名称"],nil,1};
	end

    local r=ShowMenu(menu,4,0,200,200,0,0,1,1,24,C_ORANGE, C_WHITE);

    if r>0 then

		lib.ShowSlow(50,1);
		ChangeSMap(Address[r][1],Address[r][2],Address[r][3],0);       --设置新场景
		--设置新的主地图坐标，以便从新场景正确出来。
		ChangeMMap(JY.Scene[JY.SubScene]["外景入口X1"],JY.Scene[JY.SubScene]["外景入口Y1"]+1,0);

        lib.ShowSlow(50,0);
    end;

    Cls();
    return 1;
end



-- 下面是事件执行

--在事件执行时，首先根据JY.CurrentEventType变量确定事件触发方式 1 空格触发 2 物品触发 3路过触发
--然后根据JY.SubScene 和JY.CurrentD 得到当前事件和当前D* 数据。读取D*相应触发事件的值。
--最后根据这个值来判断事件应该执行的动作。然后按照需要可以修改此值，达到更新事件动作的目的


    if JY.CurrentEventType~=1 then
	    return ;
	end

    local v=GetD(JY.SubScene,JY.CurrentD,2);       --得到空格触发事件的值

	if v<0 then
	    return ;
	elseif v==0 then
        Talk("咦？你刚才还在外面，怎么突然就到这里来了？莫不是使出了传说中的移行幻影之术？",0);
		TalkEx("哈哈，你看错了。我是韦小宝的哥哥韦大宝，我们两个是孪生，所以很多人都会认错的。",111,0);
        Talk("你既然是他哥哥，那么本领是不是比他大那么一点点呢？",0);
		TalkEx("那当然，他的那些货色也只能哄哄新人，没他的货同样可以在江湖上混。我这里提供的都是特殊服务，你要不要试试看？",111,0);
        Talk("你都提供哪些特殊服务啊？介绍一下先",0);
		TalkEx("提供以下几种服务：典当服务，地下市场，佣兵行会，瞬息千里",111,0);
        Talk("那典当服务就是当铺了？",0);
		TalkEx("对，你身上用不着的东西，都可以进行在这里当掉。不过是死当，不能赊回的。当然，有些东西我们是不收的。我们只收药品。也回收地下市场出售的物品",111,0);
        Talk("地下市场是什么？莫非是黑市？",0);
		TalkEx("嘘！小声点，当心官差来了。这里提供市面上见不到的特殊物品。",111,0);
        Talk("那佣兵行会是干什么的，难道也能接任务做？",0);
		TalkEx("对啊！你是不是经常感到没钱花？我们可以给你提供挣钱的机会，给你任务做。可以挣钱的同时顺便练练级。",111,0);
        Talk("有道理，那瞬息千里是干什么的？",0);
		TalkEx("看你大老远跑到我这里来。我可以给你免费提供去其他客栈的服务，您一眨眼的功夫，就到了其他客栈了，岂不美哉？",111,0);

        SetD(JY.SubScene,JY.CurrentD,2,1)     --设置空格触发事件的值
    elseif v==1 then
		TalkEx("要不要试试我提供的特殊服务？",111,0);
        Talk("不错，不错。我来见识一下你的特殊服务。",0);
        Cls();

		local menu={ {"典当服务",Menu_Sale,1},
		             {"地下市场",Menu_Shop,1},
		             {"佣兵行会",Menu_Task,1},
					 {"瞬息千里",Menu_Go,1},}
        local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
        local r=ShowMenu(menu,4,0,CC.MainSubMenuY,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);
		Cls();

	end
