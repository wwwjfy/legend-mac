


---本模块存放对JYMain.lua 的修改和扩充。

--尽量把新增加模块放在这里，少修改原始JYMain.Lua文件。
--这里一般包括以下几个部分
--1. SetModify函数。   该函数在游戏开始时调用，可以在此修改原有的数据，以及重定义原有的函数，以实现对原有函数的修改、
--                    这样就可以基本不动原始的函数
--2. 原有函数的重载函数。 SetModify中重载的函数放在此处。尽量不修改JYMain.lua文件，对它的修改采用重定义函数的形式。
--3. 新的物品使用函数。
--4. 新的场景事件函数。





--对jymain的修改，以及增加新的物品函数和场景事件函数。
--注意这里可以定义全程变量。
function SetModify()

   --这是一个定义函数的例子。这里重新修改主菜单中的系统菜单，增加在游戏运行中控制音效的功能。
   --原来只能在jyconst.lua中通过参数在运行前控制，不能做到实时控制。
   Menu_System_old=Menu_System;         --备份原始函数，如果新的函数需要，还可以调用原始函数。
   Menu_System=Menu_System_new;

   --在此定义特殊物品。没有定义的均调用缺省物品函数
    JY.ThingUseFunction[182]=Show_Position;     --罗盘函数
	JY.ThingUseFunction[0]=newThing_0;   --改变原来康贝特的功能为醉生梦死酒忘记武功。
	JY.ThingUseFunction[2]=newThing_2;

  --在此可以定义使用新事件函数的场景
    JY.SceneNewEventFunction[1]=newSceneEvent_1;          --新的河洛客栈事件处理函数

end


--新的系统子菜单，增加控制音乐和音效
function Menu_System_new()
	local menu={
	             {"读取进度",Menu_ReadRecord,1},
                 {"保存进度",Menu_SaveRecord,1},
				 {"关闭音乐",Menu_SetMusic,1},
				 {"关闭音效",Menu_SetSound,1},
				 {"全屏切换",Menu_FullScreen,1},
                 {"离开游戏",Menu_Exit,1},   };

    if JY.EnableMusic==0 then
	    menu[3][1]="打开音乐";
	end

	if JY.EnableSound==0 then
	    menu[4][1]="打开音效";
    end


    local r=ShowMenu(menu,6,0,CC.MainSubMenuX,CC.MainSubMenuY,0,0,1,1,CC.DefaultFont,C_ORANGE, C_WHITE);
    if r == 0 then
        return 0;
    elseif r<0 then   --要退出全部菜单，
        return 1;
 	end
end

function Menu_FullScreen()
    lib.FullScreen();
	lib.Debug("finish fullscreen");
end

function Menu_SetMusic()
    if JY.EnableMusic==0 then
	    JY.EnableMusic=1;
		PlayMIDI(JY.CurrentMIDI);
	else
	    JY.EnableMusic=0;
		lib.PlayMIDI("");
	end
	return 1;
end

function Menu_SetSound()
    if JY.EnableSound==0 then
	    JY.EnableSound=1;
	else
	    JY.EnableSound=0;
	end
	return 1;
end


----------------------------------------------------------------
---------------------------物品使用函数--------------------------


--罗盘函数，显示主地图主角位置
function Show_Position()
    if JY.Status ~=GAME_MMAP then
        return 0;
    end
    DrawStrBoxWaitKey(string.format("当前位置(%d,%d)",JY.Base["人X"],JY.Base["人Y"]),C_ORANGE,CC.DefaultFont);
	return 1;
end


--醉生梦死酒。喝后可以忘掉一种武功
function newThing_0(id)
    if JY.Status ==GAME_WMAP then
	    return 0;
	end

    Cls();
    if DrawStrBoxYesNo(-1,-1,"喝后会忘记武功，但损害生命，是否继续?",C_WHITE,CC.DefaultFont,1) == false then
        return 0;
    end
    Cls();
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("谁要服用%s?",JY.Thing[id]["名称"]),C_WHITE,CC.DefaultFont,1);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    local r=SelectTeamMenu(CC.MainSubMenuX,nexty);
    if r<=0 then
	    return 0;
	end

	local pid=JY.Base["队伍" .. r];

	if JY.Person[pid]["生命最大值"]<=50 then
	    return 0;
	end

	Cls();
    local numwugong=0;
    local menu={};
    for i=1,10 do
        local tmp=JY.Person[pid]["武功" .. i];
        if tmp>0 then
            menu[i]={JY.Wugong[tmp]["名称"],nil,1};
            numwugong=numwugong+1;
        end
    end

    if numwugong==0 then
        return 0;
    end

    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("请选择要忘记的武功"),C_WHITE,CC.DefaultFont,1);

	r=ShowMenu(menu,numwugong,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);

    if r<=0 then
	    return 0;
    else
        local s=string.format("%s 忘记武功 %s",JY.Person[pid]["姓名"],JY.Wugong[JY.Person[pid]["武功" .. r]]["名称"]);
		DrawStrBoxWaitKey(s,C_WHITE,24);

		for i=r+1,10 do
		    JY.Person[pid]["武功" .. i-1]=JY.Person[pid]["武功" .. i];
		    JY.Person[pid]["武功等级" .. i-1]=JY.Person[pid]["武功等级" .. i];
		end

		local v,str=AddPersonAttrib(pid,"生命最大值",-50);

	    DrawStrBoxWaitKey(str,C_WHITE,CC.DefaultFont);
        AddPersonAttrib(pid,"生命",0);

        instruct_32(id,-1);
	end
    Cls();
	return 1;
end


--还魂液，战斗时可以使一个死亡的队友复活，各项机能恢复50%
function newThing_2(thingid)
    if JY.Status ~=GAME_WMAP then
	    return 0;
	end

	local menu={};
    local menunum=0;
    for i=0,WAR.PersonNum-1 do
	    menu[i+1]={JY.Person[WAR.Person[i]["人物编号"]]["姓名"],nil,0}
        if WAR.Person[i]["我方"]==true and WAR.Person[i]["死亡"]==true then
            menu[i+1][3]=1;
			menunum=menunum+1;
        end
    end

	if menunum==0 then
	    return 0;
	end

	Cls();
    DrawStrBox(CC.MainSubMenuX,CC.MainSubMenuY,string.format("请选择要复活的队友"),C_WHITE,CC.DefaultFont);
	local nexty=CC.MainSubMenuY+CC.SingleLineHeight;
    local r=ShowMenu(menu,WAR.PersonNum,0,CC.MainSubMenuX,nexty,0,0,1,1,CC.DefaultFont,C_ORANGE,C_WHITE);
    Cls();
    if r>0 then
	    r=r-1;           --菜单返回值是从1开始编号的。
		WAR.Person[r]["死亡"]=false;
        local pid=WAR.Person[r]["人物编号"];
        JY.Person[pid]["生命"]=JY.Person[pid]["生命最大值"];
        SetRevivePosition(r);
        instruct_32(thingid,-1);
        WarSetPerson();        --重新设定战斗位置
	    return 1;
	else
	    return 0;
	end
end

--设置复活队友的位置为距离当前使用物品的战斗人物最近的空位
function  SetRevivePosition(id)
	local minDest=math.huge;
	local x,y;
	War_CalMoveStep(WAR.CurID,100,0);   --计算移动步数 假设最大100步
	for i=0,CC.WarWidth-1 do
		for j=0,CC.WarHeight-1 do
			local dest=Byte.get16(WAR.Map3,(j*CC.WarWidth+i)*2);
			if dest>0 and dest <128 then
				if minDest>dest then
					minDest=dest;
					x=i;
					y=j;
				 elseif minDest==dest  then
					 if Rnd(2)==0 then
						x=i;
						y=j;
					end
				end
			end
		end
	end

	if minDest<math.huge then
        WAR.Person[id]["坐标X"]=x;
        WAR.Person[id]["坐标Y"]=y;
	end

end


------------------------------------------------------------------------------------------
-------新的场景事件函数实例

--对每个场景每个D*都对应一个lua文件。在此文件中处理不同的触发方式和事件变化情况
--这样做有一个缺点，如果多个D*需要调用同样的事件怎么办？一个办法是在一个lua文件中继续用dofile调用另一个。
--另一个办法是做一个自定义的场景事件处理函数，在里面判断不同的D调用不同的函数。


-------新的河洛客栈场景事件处理函数
--由于这是在旧的处理函数基础上增加了D*，因此才需要单独定制一个函数。
--如果是全新的处理函数，直接使用newCallEvent即可。
--flag 1 空格触发，2，物品触发，3，路过触发
function newSceneEvent_1(flag)
    if JY.CurrentD<=18 then     --对以前编号的D*，仍然调用旧的处理函数
        oldEventExecute(flag);
    else
        newCallEvent(flag);
	end
end


--新的通用事件处理函数
function newCallEvent(flag)

    JY.CurrentEventType=flag;

	local eventnum;
	if flag==1 then
		eventnum=GetD(JY.SubScene,JY.CurrentD,2);
	elseif flag==2 then
		eventnum=GetD(JY.SubScene,JY.CurrentD,3);
	elseif flag==3 then
		eventnum=GetD(JY.SubScene,JY.CurrentD,4);
	end

    if eventnum>=0 then           --只有大于或等于0时才调用lua文件。
	--按照给定格式生成要调用的D*处理文件名。然后加载运行
		local eventfilename=string.format(CONFIG.NewEventPath .. "scene_%d_event_%d.lua",JY.SubScene,JY.CurrentD);
		dofile(eventfilename);
    end

    JY.CurrentEventType=-1;
end

