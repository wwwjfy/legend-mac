--function oldevent_64()

    if instruct_16(9,11,0) ==false then    --  16(10):队伍是否有[张无忌]是则跳转到:Label0
        instruct_1(221,0,1);   --  1(1):[WWW]说: 前辈，别来无恙？
        instruct_0();   --  0(0)::空语句(清屏)
        instruct_1(222,13,0);   --  1(1):[谢逊]说: 哼！你又来做什麽．
        instruct_0();   --  0(0)::空语句(清屏)
        do return; end
    end    --:Label0

    instruct_1(223,9,1);   --  1(1):[张无忌]说: 义父，你跟我们一起回中土*吧．
    instruct_0();   --  0(0)::空语句(清屏)
    instruct_1(220,13,0);   --  1(1):[谢逊]说: 你过的很好，义父就很高兴*了．义父还要待在这思考对*付成崑的办法，你走吧．*记着，闯荡江湖千万要提防*小人，就算是自己的师父，*义兄都一样．
    instruct_0();   --  0(0)::空语句(清屏)
--end

