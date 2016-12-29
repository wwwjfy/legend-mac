基于游泳的鱼的金庸群侠传lua复刻版，修改gbk编码为utf8编码，移植到Mac OS X上。

在 Lua 5.2.4 下编译成功

### 编译

 - 用 Homebrew 安装 lua, sdl, sdl\_image, sdl\_mixer, sdl\_ttf

```
brew install lua sdl sdl_image sdl_mixer sdl_ttf
```

 - 安装 smpeg

```
brew tap homebrew/headonly
# it'll install a bunch of packages, mainly gtk related.
brew install smpeg
```

 - 编译

```
cd src
make
```

### 运行

```
cd bin
./jy
```

### ubuntu 16.04 下编译

```
sudo apt-get install libsdl1.2-dev libsdl-image1.2 libsdl-image1.2-dev libsdl-mixer1.2 libsdl-mixer1.2-dev libsdl-ttf2.0-0 libsdl-ttf2.0-dev libsmpeg-dev libsmpeg0 lua5.2 liblua5.2-dev liblua5.2-0 build-essential pkg-config gcc
cd src
make
cd ../bin
./jy # run game
```

## 已知问题

- macOS Sierra 下动画播放卡顿
- 因为使用luaL_openlib，不能使用Lua5.3编译
