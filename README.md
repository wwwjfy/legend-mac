基于游泳的鱼的金庸群侠传lua复刻版，修改gbk编码为utf8编码，移植到 macOS 上。

在 Lua 5.4 下编译成功，使用 SDL 2。

### 编译

 - 用 Homebrew 安装依赖

```
brew install lua sdl2 sdl2_image sdl2_mixer sdl2_ttf
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

### ubuntu 下编译

```
sudo apt-get install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev lua5.4 liblua5.4-dev build-essential pkg-config gcc
cd src
make
cd ../bin
./jy # run game
```

## 已知问题

- macOS Catalina 下动画播放卡顿
