// 头文件 

#ifndef _JYMAIN_H
#define _JYMAIN_H

#include "config.h"

#include "SDL.h"
#include "SDL_ttf.h"
#include "SDL_image.h"
#include "SDL_mixer.h"
#ifdef HAS_SDL_MPEG
    #include "smpeg.h"
#endif

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
 
#include "luafun.h"

#include "list.h" 



#ifdef __cplusplus
extern "C" {
#endif


// 公共部分

//安全free指针的宏

#define SafeFree(p) for(;;) {if(p) {free(p);p=NULL;}break;} 

//全程变量


// jymain.c


int Lua_Main(lua_State *pL);

int Lua_Config(lua_State *pL,const char *filename);

int getfield(lua_State *pL,const char *key);


int getfieldstr(lua_State *pL,const char *key,char *str);


// 输出信息到文件debug.txt中
int JY_Debug(const char * str,...);

// 输出信息到文件error.txt中
int JY_Error(const char * fmt,...);

//限制 x在 xmin-xmax之间
int limitX(int x, int xmin, int xmax);

//取文件长度
int FileLength(const char *filename);



//CharSet.c

typedef struct UseFont_Type{      // 定义当前使用的字体结构
	int size;         //字号，单位像素
	char *name;       //字体文件名
    TTF_Font *font;   //打开的字体
}UseFont;

#define FONTNUM 10      //定义同时打开的字体个数

//初始化字体
int InitFont();

//释放字体结构
int ExitFont();

// 根据字体文件名和字号打开字体
// size 为按像素大小的字号
static TTF_Font *GetFont(const char *filename,int size);

// 写字符串
// x,y 坐标
// str 字符串
// color 颜色
// size 字体大小，字形为宋体。 
// fontname 字体名
int JY_DrawStr(int x, int y, const char *str,int color,int size,const char *fontname);


//PicCache.c

// 定义使用的链表 
struct CacheNode{    //贴图cache链表节点
	SDL_Surface *s;               // 此贴图对应的表面
	int xoff;                     // 贴图偏移
	int yoff;
	int id;                  //贴图编号
    int fileid;              //贴图文件编号
    struct list_head list;        // 链表结构，linux.h中的list.h中定义
} ;


struct PicFileCache{   //贴图文件链表节点
	int num;                    // 文件贴图个数
    int *idx;                  // idx的内容
    int filelength;            //grp文件长度
    FILE *fp;                  //grp文件句柄
    unsigned char *grp;         // grp的内容
    struct CacheNode **pcache;  // 文件中所有的贴图对应的cache节点指针，为空则表示没有。
};

#define PIC_FILE_NUM 40   //缓存的贴图文件(idx/grp)个数



int Init_Cache();

int JY_PicInit(char *PalletteFilename);

int JY_PicLoadFile(const char*idxfilename, const char* grpfilename, int id);

int JY_LoadPic(int fileid, int picid, int x,int y,int flag,int value);

static int LoadPic(int fileid,int picid, struct CacheNode *cache);

int JY_GetPicXY(int fileid, int picid, int *w,int *h,int *xoff,int *yoff);
 
static SDL_Surface* CreatePicSurface32(unsigned char *data, int w,int h,int datalong);

static int LoadPallette(char *filename); 
 

//mainmap.c

typedef struct Building_Type{   
	int x;
	int y;
	int num;
}BuildingType;


int JY_LoadMMap(const char* earthname, const char* surfacename, const char*buildingname,
				const char* buildxname, const char* buildyname, int x_max, int y_max,int x,int y);

int JY_UnloadMMap(void);

int LoadMMap();

int LoadMMap_Sub(const char*filename,Sint16 **p);

int LoadMMap_Part(int read,int x,int y);

int LoadMMap_Part_Sub(FILE *fp,Sint16 **p);

int JY_GetMMap(int x, int y , int flag);

int JY_SetMMap(short x, short y , int flag, short v);



int BuildingSort(short x, short y, short Mypic);

// 绘制主地图
int JY_DrawMMap(int x, int y, int Mypic);

int JY_LoadSMap(const char *Sfilename,const char*tmpfilename, int num,int x_max,int y_max,
				const char *Dfilename,int d_num1,int d_num2);

int JY_SaveSMap(const char *Sfilename,const char *Dfilename);

int JY_UnloadSMap();

int ReadS(int id);

int WriteS(int id);

int JY_GetS(int id,int x,int y,int level);



int JY_SetS(int id,int x,int y,int level,int v);

int JY_GetD(int Sceneid,int id,int i);

int JY_SetD(int Sceneid,int id,int i,int v);

int JY_DrawSMap(int sceneid,int x, int y,int xoff,int yoff, int Mypic);

int JY_LoadWarMap(const char *WarIDXfilename,const char *WarGRPfilename, int mapid,int num, int x_max,int y_max);

int JY_UnloadWarMap();

int JY_GetWarMap(int x,int y,int level);

int JY_SetWarMap(int x,int y,int level,int v);

int JY_CleanWarMap(int level,int v);

int JY_DrawWarMap(int flag, int x, int y, int v1,int v2,int v3);

 


//sdlfun.c

static int KeyFilter(const SDL_Event *event);

int InitSDL(void);

int ExitSDL(void);

Uint32 ConvertColor(Uint32 color);

int InitGame(void);

int ExitGame(void);

int JY_LoadPicture(const char* str,int x,int y);

int JY_ShowSurface(int flag); 

int JY_ShowSlow(int delaytime,int Flag);

int JY_Delay(int x);

double JY_GetTime();

int JY_PlayMIDI(const char *filename);

int StopMIDI();

int JY_PlayWAV(const char *filename);

int JY_GetKey();





int JY_SetClip(int x1,int y1,int x2,int y2);


int JY_DrawRect(int x1,int y1,int x2,int y2,int color);

void HLine32(int x1,int x2,int y,int color, unsigned char *vbuffer, int lpitch);
void VLine32(int x1,int x2,int y,int color, unsigned char *vbuffer, int lpitch);

int JY_FillColor(int x1,int y1,int x2,int y2,int color);



int BlitSurface(SDL_Surface* lpdds, int x, int y ,int flag,int value);

int JY_Background(int x1,int y1,int x2,int y2,int Bright);


int JY_PlayMPEG(const char* filename,int esckey);

int JY_FullScreen();

SDL_Surface *RotateSurface(SDL_Surface *src);

SDL_Rect RotateRect(const SDL_Rect *rect);

SDL_Rect RotateReverseRect(const SDL_Rect *rect);


#ifdef __cplusplus
}
#endif

 
#endif