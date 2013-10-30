基于游泳的鱼的金庸群侠传lua复刻版，修改gbk编码为utf8编码，移植到Mac OS X上。

### 编译

 - 用 Homebrew 安装 sdl, sdl\_image, sdl\_mixer, sdl\_ttf

```
brew install sdl sdl_image sdl_mixer sdl_ttf
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
