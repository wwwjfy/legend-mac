//适应不同平台和编译器的兼容性

//目前只在VC6/VC8/symbian C/gcc下测试通过

#ifndef __CONFIG_H
#define __CONFIG_H


// 定义程序运行时在运行目录下访问的文件名。用于主程序运行目录不是当前目录的情况下。
#ifdef __SYMBIAN32__

    #define CONFIG_FILE "e:\\data\\jy\\config.lua"
    #define DEBUG_FILE "e:\\data\\jy\\debug.txt"
    #define ERROR_FILE "e:\\data\\jy\\error.txt"
    #define HZMB_FILE "e:\\data\\jy\\hzmb.dat"

#else

    #define CONFIG_FILE "config.lua"
    #define DEBUG_FILE "debug.txt"
    #define ERROR_FILE "error.txt"
    #define HZMB_FILE "hzmb.dat"

#endif

//定义vsnprintf. vc6并不支持
#if defined(_MSC_VER) && _MSC_VAR<1400
    #define vsnprintf _vsnprintf
#endif


//定义是否包含smpeg库

#if !defined(__SYMBIAN32__)
    #define HAS_SDL_MPEG
#endif

#if defined(_MSC_VER)
//定义高精度时钟。仅x86有效。只用于调试，用来测试小于1ms的时间间隔。正式发布版本不应该使用
   // #define HIGH_PRECISION_CLOCK

//定义CPU频率，高精度时钟使用。单位为MHz
    #define CPU_FREQUENCY 2000
#endif

#endif