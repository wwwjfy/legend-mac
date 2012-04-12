
--转换fishedit 输出的kdefout.txt为lua函数。
--对里面的所有事件进行解析。每个事件生成一个函数：名字为 oldevent_238();
--暂时只处理标准指令，指令函数名字为 instruct_23(xxx);
labellevel=0;

--指令解析
function gen_instruct(k)
    local i,j=string.find(line[k],"说明：")
    local note=string.sub(line[k],j+1);
    local instruct=string.sub(line[k],1,i-1);
    local data={};
    local num=0;
    local start=1;
    while true do
        local i,j=string.find(instruct,"[+-]?%d+",start);
        if i~=nil then
            data[num]=tonumber(string.sub(instruct,i,j));
            num=num+1;
            start=j+1;
        else
            break;
        end
    end

    if num>0 then
        if data[0]==-1 then
            outp:write("--end\n\n");
        elseif data[0]==7 then
            outp:write(string.rep("    ",labellevel),"do return; end\n");
        else
            local jump=0;
            local value="";
            local i,j=string.find(note,"是则跳转到");
            if i~=nil then
                jump=1;
                value="false";
            end
            local i,j=string.find(note,"否则跳转到");
            if i~=nil then
                jump=2;
                value="true"
            end

            if jump==0 then
                outp:write(string.rep("    ",labellevel));
                fun(data,num);
                outp:write(";   --",note,"\n");
            else
                outp:write("\n",string.rep("    ",labellevel));
                outp:write("if ");
                fun(data,num);
                outp:write(" ==",value," then ");
                labellevel=labellevel+1;
                outp:write("   --",note,"\n");
        end

        end

    else
        labellevel=labellevel-1;
        outp:write(string.rep("    ",labellevel),"end    --",note,"\n\n");
    end

end

function fun(data,num)
    outp:write(string.format("instruct_%d(",data[0]));
    if num>1 then
        outp:write(string.format("%d",data[1]));
        for i=2,num-1 do
            outp:write(string.format(",%d",data[i]));
        end
    end
    outp:write(string.format(")",data[1]));
end



    inp=io.open("kdefout.txt","r");

    print("start");
    line={};
    local n=0;
    while true do
        local s=inp:read("*l");
        if s==nil then
            break;
        end
        if #s>0 then
            line[n]=s;
            n=n+1;
        end
    end
    inp:close();

    outp=io.open("kdefnew.lua","w");
    for k=0,n-1 do
        local i,j=string.find(line[k],"事件[+-]?%d+");
        if i==1 then          --第一个位置
            local i,j=string.find(line[k],"[+-]?%d+");      --匹配数字
			outp:close();
            outp=io.open(string.format("oldevent\\oldevent_%d.lua",tonumber(string.sub(line[k],i,j))),"w");
            outp:write(string.format("--function oldevent_%d()\n",tonumber(string.sub(line[k],i,j))));
            labellevel=1;
        else
            gen_instruct(k);
        end
    end

    outp:close();


    inp=io.open("talk.txt","r");
    outp=io.open("oldtalk.grp","w");
    local s=inp:read("*l");
    while true do
        local s=inp:read("*l");
        if s==nil then
            break;
        end
        if #s>0 then
            local i,j=string.find(s,"[+-]?%d+");      --匹配数字
            local id=tonumber(string.sub(s,i,j))
            i,j=string.find(s,'"%x+",',j+1);        --匹配带引号的数字
            i,j=string.find(s,'".*"',j+1);          --匹配最后的字符串
            local talk=string.sub(s,i+1,j-1)
			local newtalk=string.gsub(talk,'""','"');           --把字符串中的""替换成"
            outp:write(string.format('%s\n',newtalk));
        end
    end
    inp:close();
    outp:close();

