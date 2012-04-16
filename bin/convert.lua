local struct = require 'struct'
local iconv = require 'iconv'

function fsize(file)
    local current = file:seek()
    local size = file:seek("end")
    file:seek("set", current)
    return size
end

function stringdump(str)
    for i=1,string.len(str) do
        io.write(string.format("%02x ", string.byte(str,i)))
    end
    io.write("\n")
end

local idx = {}
local idx_file = io.open('r3.idx', 'rb')
for i=1,6 do
    local tmp, _ = struct.unpack('<I4', idx_file:read(4))
    idx[i] = tmp
end
io.close(idx_file)
local new_idx = {}

local grp_file = io.open('r3.grp', 'rb')
local new_grp_file = io.open('r3.grp.new', 'wb')

-- base data
local copy = grp_file:read(idx[1])
new_grp_file:write(copy)
new_idx[1] = idx[1]

local cd = iconv.new('utf8', 'big5')

-- person
old_person_size = 182
person_num = (idx[2]-idx[1])/old_person_size

-- i=1
for i=1,person_num do
    local copy = grp_file:read(8)
    new_grp_file:write(copy)

    local name = grp_file:read(10)
    local new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 20-#new_name)
    new_grp_file:write(new_name)

    name = grp_file:read(10)
    new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 20-#new_name)
    new_grp_file:write(new_name)

    copy = grp_file:read(154)
    new_grp_file:write(copy)
end
new_idx[2] = new_idx[1] + person_num * (182 + 10 + 10)

-- thing
old_thing_size = 190
thing_num = (idx[3]-idx[2])/old_thing_size

for i=1,thing_num do
    local copy = grp_file:read(2)
    new_grp_file:write(copy)

    local name = grp_file:read(20)
    local new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 40-#new_name)
    new_grp_file:write(new_name)

    local name = grp_file:read(20)
    local new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 40-#new_name)
    new_grp_file:write(new_name)

    local name = grp_file:read(30)
    local new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 60-#new_name)
    new_grp_file:write(new_name)

    copy = grp_file:read(118)
    new_grp_file:write(copy)
end
new_idx[3] = new_idx[2] + thing_num * (190 + 20 + 20 + 30)

-- scene
old_scene_size = 52
scene_num = (idx[4]-idx[3])/old_scene_size

for i=1,scene_num do
    local copy = grp_file:read(2)
    new_grp_file:write(copy)

    local name = grp_file:read(10)
    local new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 20-#new_name)
    new_grp_file:write(new_name)

    copy = grp_file:read(40)
    new_grp_file:write(copy)
end
new_idx[4] = new_idx[3] + scene_num * (52 + 10)

-- wugong
old_wugong_size = 136
wugong_num = (idx[5]-idx[4])/old_wugong_size

for i=1,wugong_num do
    local copy = grp_file:read(2)
    new_grp_file:write(copy)

    local name = grp_file:read(10)
    local new_name = cd:iconv(name)
    new_name = new_name .. string.rep(string.char(0), 20-#new_name)
    new_grp_file:write(new_name)

    copy = grp_file:read(124)
    new_grp_file:write(copy)
end
new_idx[5] = new_idx[4] + wugong_num * (136 + 10)

-- shop
old_shop_size = 30
shop_num = (idx[6]-idx[5])/old_shop_size

for i=1,shop_num do
    local copy = grp_file:read(30)
    new_grp_file:write(copy)
end
new_idx[6] = new_idx[5] + shop_num * 30

local new_idx_file = io.open('r3.idx.new', 'wb')
for i=1,6 do
    new_idx_file:write(struct.pack('<I4', new_idx[i]))
end
io.close(new_idx_file)

io.close(grp_file)