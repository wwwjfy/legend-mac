 

// SDL 相关函数

#include "jymain.h"
 
static Mix_Music *currentMusic=NULL;         //播放音乐数据，由于同时只播放一个，用一个变量

#define WAVNUM 5

static Mix_Chunk *WavChunk[WAVNUM];        //播放音效数据，可以同时播放几个，因此用数组

static int currentWav=0;                  //当前播放的音效

#define RECTNUM  20
static SDL_Rect ClipRect[RECTNUM];        // 当前设置的剪裁矩形
static int currentRect=0;

extern SDL_Window* g_Window;          // 游戏窗口
extern SDL_Surface* g_Surface;        // 游戏使用的视频表面
extern Uint32 g_MaskColor32;      // 透明色

extern int g_Rotate;

extern int g_ScreenW ;
extern int g_ScreenH ;
extern int g_ScreenBpp ;

extern int g_FullScreen;
extern int g_EnableSound;
extern int g_MusicVolume;
extern int g_SoundVolume;


//过滤ESC、RETURN、SPACE键，使他们按下后不能重复。
static int KeyFilter(void *userdata, SDL_Event *event)
{
	static int Esc_KeyPress=0;
	static int Space_KeyPress=0;
	static int Return_KeyPress=0;

	int r=1;
	switch(event->type){   
    case SDL_KEYDOWN:  
		switch(event->key.keysym.sym){
	    case SDLK_ESCAPE:
			if(1==Esc_KeyPress){
				r=0;
			}
			else{
			    Esc_KeyPress=1;
			}
			break;
	    case SDLK_RETURN:
			if(1==Return_KeyPress){
				r=0;
			}
			else{
			    Return_KeyPress=1;
			}
			break;
	    case SDLK_SPACE:
			if(1==Space_KeyPress){
				r=0;
			}
			else{
			    Space_KeyPress=1;
			}
			break;
		default:
            break;
		}
		break;
    case SDL_KEYUP:
		switch(event->key.keysym.sym){
	    case SDLK_ESCAPE:
			Esc_KeyPress=0;
			break;
		case SDLK_SPACE:
			Space_KeyPress=0;
			break;
	    case SDLK_RETURN:
			Return_KeyPress=0;
			break;
		default:
            break;
		}
        break;
    default: 
        break;
    }

    return r;
}
// 初始化SDL
int InitSDL(void)
{
	int r;
	int i;

	r=SDL_Init(SDL_INIT_VIDEO);
    if( r < 0 ) {
        JY_Error(
                "Couldn't initialize SDL: %s\n", SDL_GetError());
        exit(1);
    }

    //atexit(SDL_Quit);    可能有问题，屏蔽掉
 
    JY_Debug("Video Driver: %s\n",SDL_GetCurrentVideoDriver());

    InitFont();  //初始化
    
	r=SDL_InitSubSystem(SDL_INIT_AUDIO);
    if(r<0)
        g_EnableSound=0;

    r=Mix_OpenAudio(MIX_DEFAULT_FREQUENCY, MIX_DEFAULT_FORMAT, 2, 4096);

   if( r < 0 ) {
        JY_Error(
                "Couldn't initialize SDL_Mixer: %s\n", SDL_GetError());
        g_EnableSound=0;
    }

	currentWav=0;

    for(i=0;i<WAVNUM;i++)
         WavChunk[i]=NULL;

    SDL_SetEventFilter(KeyFilter, NULL);

    return 0;
}

// 退出SDL
int ExitSDL(void)
{
	int i;

    ExitFont();

    StopMIDI();

    for(i=0;i<WAVNUM;i++){
		if(WavChunk[i]){
             Mix_FreeChunk(WavChunk[i]);
		     WavChunk[i]=NULL;
		}
	}

	Mix_CloseAudio();

    JY_LoadPicture("",0,0);    // 释放可能加载的图片表面
    if(g_Window){
        SDL_DestroyWindow(g_Window);
        g_Window = NULL;
    }
    SDL_Quit();
    return 0;
}

// 转换0RGB到当前屏幕颜色
Uint32 ConvertColor(Uint32 color){
   Uint8 *p=(Uint8*)&color;
   return SDL_MapRGB(g_Surface->format,*(p+2),*(p+1),*p);
}    


// 初始化游戏数据
int InitGame(void)
{
    int w,h;

	if(g_Rotate==0){
		w=g_ScreenW;
		h=g_ScreenH;
	}
	else{
		w=g_ScreenH;
		h=g_ScreenW;
	}


    {
        Uint32 flags = SDL_WINDOW_SHOWN;
        if(g_FullScreen)
            flags |= SDL_WINDOW_FULLSCREEN;
        g_Window = SDL_CreateWindow("JY Legend",
            SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
            w, h, flags);
        if(g_Window == NULL){
            JY_Error("Cannot create window: %s", SDL_GetError());
        }
        else{
            g_Surface = SDL_GetWindowSurface(g_Window);
            if(g_Surface == NULL)
                JY_Error("Cannot get window surface: %s", SDL_GetError());
            SDL_RaiseWindow(g_Window);  // Ensure window has input focus
        }
    }

    Init_Cache();
	
    JY_PicInit("");        // 初始化贴图cache

    return 0;
}




// 释放游戏资源
int ExitGame(void)
{

    JY_PicInit("");
    
    JY_LoadPicture("",0,0);

    JY_UnloadMMap();     //释放主地图内存

	JY_UnloadSMap();     //释放场景地图内存

    JY_UnloadWarMap();   //释放战斗地图内存

    return 0;
}





//加载图形文件，其他格式也可以加载
//x,y =-1 则加载到屏幕中心
//    如果未加载，则加载，然后blit，如果加载，直接blit
//  str 文件名，如果为空，则释放表面        
int JY_LoadPicture(const char* str,int x,int y)
{
    static char filename[255]="\0";   		
	static SDL_Surface *pic=NULL;

	SDL_Surface *tmppic;
	SDL_Rect r;

	if(strlen(str)==0){        // 为空则释放表面
        if(pic){
		    SDL_FreeSurface(pic);
            pic=NULL;
        }
		return 0;
	}
	
    if(strcmp(str,filename)!=0){ // 与以前文件名不同，则释放原来表面，加载新表面
        if(pic){
		    SDL_FreeSurface(pic);
            pic=NULL;
        }
        tmppic = IMG_Load(str);
        if(tmppic){
		    pic=SDL_ConvertSurface(tmppic, g_Surface->format, 0);   // 改为当前表面的像素格式
 		    SDL_FreeSurface(tmppic);
			if(g_Rotate==1){
                tmppic=RotateSurface(pic);
 		        SDL_FreeSurface(pic);
                pic=tmppic;
			}
            strcpy(filename,str);
        }
	}

	if(pic){
	    if(g_Rotate==0){
			if( (x==-1) && (y==-1) ){
				x=(g_ScreenW-pic->w)/2;
				y=(g_ScreenH-pic->h)/2;
			}
			r.x=(Sint16)x;
			r.y=(Sint16)y;
		}
		else{
			if( (x==-1) && (y==-1) ){
				x=(g_ScreenW-pic->h)/2;
				y=(g_ScreenH-pic->w)/2;
			}
			r.x=(Sint16)y;
			r.y=(Sint16)x;
		}

		SDL_BlitSurface(pic, NULL, g_Surface, &r);

	}
	else{
        JY_Error("JY_LoadPicture: Load picture file %s failed!",str);
	}

	return 0;
}



//显示表面
//flag = 0 显示全部表面  =1 按照JY_SetClip设置的矩形显示，如果没有矩形，则不显示
int JY_ShowSurface(int flag)
{
	if(flag==1){
		if(currentRect>0){
			SDL_UpdateWindowSurfaceRects(g_Window,ClipRect,currentRect);
		}
	}
	else{
        SDL_UpdateWindowSurface(g_Window);
	}
	return 0;
}

//延时x毫秒
int JY_Delay(int x)
{
    SDL_Delay(x);
    return 0;
}


// 缓慢显示图形 
// delaytime 每次渐变延时毫秒数
// Flag=0 从暗到亮，1，从亮到暗
int JY_ShowSlow(int delaytime,int Flag)
{
    int i;
	int step;
	int t1,t2;
	int alpha;

 
    SDL_Surface* lps1;  // 建立临时表面
	lps1=SDL_CreateRGBSurface(SDL_SWSURFACE,g_Surface->w,g_Surface->h,g_Surface->format->BitsPerPixel,
		                      g_Surface->format->Rmask,g_Surface->format->Gmask,g_Surface->format->Bmask,0);

	if(lps1==NULL){
		JY_Error("JY_ShowSlow: Create surface failed!");
		return 1;
	}

	SDL_BlitSurface(g_Surface ,NULL,lps1,NULL);    //当前表面复制到临时表面

	for(i=0;i<=32;i++)
	{
        if(Flag==0)
			step=i;
	    else
			step=32-i;

        t1=(int)JY_GetTime();
 
        SDL_FillRect(g_Surface,NULL,0);          //当前表面变黑

        alpha=step<<3;
		if(alpha>255) 
			alpha=255;

        SDL_SetSurfaceBlendMode(lps1, SDL_BLENDMODE_BLEND);
        SDL_SetSurfaceAlphaMod(lps1,(Uint8)alpha);  //设置alpha


		SDL_BlitSurface(lps1 ,NULL,g_Surface,NULL); 

        JY_ShowSurface(0);

        t2=(int)JY_GetTime();

		if(delaytime > t2-t1)
			JY_Delay(delaytime-(t2-t1));
	}

    SDL_FreeSurface(lps1);       //释放表面
 
	return 0;
}


#ifdef HIGH_PRECISION_CLOCK

__int64 GetCycleCount()
{
__asm _emit 0x0F
__asm _emit 0x31
} 

#endif

//得到当前时间，单位毫秒
double JY_GetTime()
{
#ifdef HIGH_PRECISION_CLOCK    
    return (double)(GetCycleCount())/(1000*CPU_FREQUENCY);
#else
    return (double) SDL_GetTicks();
#endif

}



 
//播放音乐
int JY_PlayMIDI(const char *filename)
{
	static char currentfile[255]="\0";

    if(g_EnableSound==0)
		return 1;

	if(strlen(filename)==0){  //文件名为空，停止播放
        StopMIDI();
        strcpy(currentfile,filename);
		return 0;
	}
	
	if(strcmp(currentfile,filename)==0) //与当前播放文件相同，直接返回
		return 0;

    StopMIDI();
	
	currentMusic=Mix_LoadMUS(filename);

	if(currentMusic==NULL){
		JY_Error("Open music file %s failed!",filename);
		return 1;
	}

	Mix_VolumeMusic(g_MusicVolume);

	Mix_PlayMusic(currentMusic, -1);

    strcpy(currentfile,filename);

	return 0;
}

//停止音效
int StopMIDI()
{
    if(currentMusic!=NULL){
		Mix_HaltMusic();
		Mix_FreeMusic(currentMusic);
		currentMusic=NULL;
	}
    return 0;
}


//播放音效
int JY_PlayWAV(const char *filename)
{
	
    if(g_EnableSound==0)
		return 1;    

	if(WavChunk[currentWav]){          //释放当前音效
        Mix_FreeChunk(WavChunk[currentWav]);
        WavChunk[currentWav]=NULL;
	}

	WavChunk[currentWav]= Mix_LoadWAV(filename);  //加载到当前音效

	if(WavChunk[currentWav]){
        Mix_VolumeChunk(WavChunk[currentWav],g_SoundVolume);
        Mix_PlayChannel(-1, WavChunk[currentWav], 0);  //播放音效
		currentWav++;
		if(currentWav>=WAVNUM)
			currentWav=0;
	}
	else{
		JY_Error("Open wav file %s failed!",filename);
	}

	return 0;
}


// 得到前面按下的字符
int JY_GetKey()
{
    SDL_Event event;
	int keyPress=-1;
    while(SDL_PollEvent(&event)){
		switch(event.type){
        case SDL_QUIT:
            exit(0);
            break;
        case SDL_KEYDOWN:
            keyPress=event.key.keysym.sym;
            break;
        case SDL_MOUSEMOTION:
            break;
        default:
            break;
        }
	}	
	return keyPress;
}


//设置裁剪
int JY_SetClip(int x1,int y1,int x2,int y2)
{
	if (x1==0 && y1==0 && x2==0 && y2==0){
		SDL_SetClipRect(g_Surface,NULL);
		currentRect=0;
	}
    else{
		SDL_Rect rect;
        rect.x=(Sint16)x1;
		rect.y=(Sint16)y1;
		rect.w=(Uint16)(x2-x1);
		rect.h=(Uint16)(y2-y1);

		if(g_Rotate==0){
            ClipRect[currentRect]=rect;
		}
		else if(g_Rotate==1){
            ClipRect[currentRect]=RotateRect(&rect);
		}


		SDL_SetClipRect(g_Surface,&ClipRect[currentRect]);
        currentRect=currentRect+1;
		if(currentRect>=RECTNUM){
			currentRect=0;
		}
	}

    return 0;
}


// 绘制矩形框
// (x1,y1)--(x2,y2) 框的左上角和右下角坐标
// color 颜色
int JY_DrawRect(int x1,int y1,int x2,int y2,int color)
{
    Uint8 *p ;
	int lpitch=0;
	Uint32 c;
	SDL_Rect rect1,rect2;
	int xmin,xmax,ymin,ymax;

	if(x1<x2){
		xmin=x1;
		xmax=x2;
	}
	else{
		xmin=x2;
		xmax=x1;
	}

	if(y1<y2){
		ymin=y1;
		ymax=y2;
	}
	else{
		ymin=y2;
		ymax=y1;
	}

	rect1.x=(Sint16)xmin;
	rect1.y=(Sint16)ymin;
	rect1.w=(Uint16)(xmax-xmin+1);
	rect1.h=(Uint16)(ymax-ymin+1);
 
    SDL_LockSurface(g_Surface);
    p=g_Surface->pixels;
	lpitch=g_Surface->pitch;

	c=ConvertColor(color);

	if(g_Rotate==0){
		rect2=rect1;
	}
	else{
        rect2=RotateRect(&rect1);
	}

    x1=rect2.x;
	y1=rect2.y;
	x2=rect2.x+rect2.w-1;
	y2=rect2.y+rect2.h-1;

	HLine32(x1,x2,y1,c,p,lpitch);
	HLine32(x1,x2,y2,c,p,lpitch);
 	VLine32(y1,y2,x1,c,p,lpitch); 
  	VLine32(y1,y2,x2,c,p,lpitch); 
 
    SDL_UnlockSurface(g_Surface);
 
	return 0;
}


//绘水平线
void HLine32(int x1,int x2,int y,int color, unsigned char *vbuffer, int lpitch)
{
 
    int temp; 
    int i;
    int max_x,max_y,min_x,min_y;
    Uint8 *vbuffer2;
	int bpp;

	bpp=g_Surface->format->BytesPerPixel;

    //手工剪裁
    min_x=g_Surface->clip_rect.x;
	min_y=g_Surface->clip_rect.y;
	max_x=g_Surface->clip_rect.x+g_Surface->clip_rect.w-1;
    max_y=g_Surface->clip_rect.y+g_Surface->clip_rect.h-1;

    if (y > max_y || y < min_y)
        return;
 
    if (x1>x2){
       temp = x1;
       x1   = x2;
       x2   = temp;
    } 

    if (x1 > max_x || x2 < min_x)
        return;

    x1 = ((x1 < min_x) ? min_x : x1);
    x2 = ((x2 > max_x) ? max_x : x2);

 
    vbuffer2=vbuffer+y*lpitch+x1*bpp;
	switch(bpp){
	case 2:        //16位色彩
		for(i=0;i<=x2-x1;i++){
			*(Uint16*)vbuffer2=(Uint16)color;
			vbuffer2+=2;
		}
        break; 
	case 3:        //24位色彩
		for(i=0;i<=x2-x1;i++){
			Uint8 *p=(Uint8*)(&color);
			*vbuffer2=*p;
			*(vbuffer2+1)=*(p+1);
			*(vbuffer2+2)=*(p+2);
			vbuffer2+=3;
		}
        break; 
	case 4:        //32位色彩
		for(i=0;i<=x2-x1;i++){
			*(Uint32*)vbuffer2=(Uint32)color;
			vbuffer2+=4;
		}
        break; 
    }
}  

//绘垂直线
void VLine32(int y1,int y2,int x,int color, unsigned char *vbuffer, int lpitch)
{
 
    int temp; 
    int i;
    int max_x,max_y,min_x,min_y;
    Uint8 *vbuffer2;
	int bpp;

	bpp=g_Surface->format->BytesPerPixel;

    min_x=g_Surface->clip_rect.x;
	min_y=g_Surface->clip_rect.y;
	max_x=g_Surface->clip_rect.x+g_Surface->clip_rect.w-1;
    max_y=g_Surface->clip_rect.y+g_Surface->clip_rect.h-1;


    if (x > max_x || x < min_x)
        return;
 
    if (y1>y2){
       temp = y1;
       y1   = y2;
       y2   = temp;
    } 

    if (y1 > max_y || y2 < min_y)
        return;

    y1 = ((y1 < min_y) ? min_y : y1);
    y2 = ((y2 > max_y) ? max_y : y2);

    vbuffer2=vbuffer+y1*lpitch+x*bpp;
	switch(bpp){
	case 2:
		for(i=0;i<=y2-y1;i++){
			*(Uint16*)vbuffer2=(Uint16)color;
			vbuffer2+=lpitch;
		}
        break; 
	case 3:
		for(i=0;i<=y2-y1;i++){
			Uint8 *p=(Uint8*)(&color);
			*vbuffer2=*p;
			*(vbuffer2+1)=*(p+1);
			*(vbuffer2+2)=*(p+2);

			vbuffer2+=lpitch;
		}
        break; 
	case 4:
		for(i=0;i<=y2-y1;i++){
			*(Uint32*)vbuffer2=(Uint32)color;
			vbuffer2+=lpitch;
		}
        break; 
    }

}  



// 图形填充
// 如果x1,y1,x2,y2均为0，则填充整个表面
// color, 填充色，用RGB表示，从高到低字节为0RGB
int JY_FillColor(int x1,int y1,int x2,int y2,int color)
{
	int c=ConvertColor(color);

    SDL_Rect rect;
   
	if(x1==0 && y1==0 && x2==0 && y2==0){
        SDL_FillRect(g_Surface,NULL,c);
	}
	else{
		rect.x=(Sint16)x1;
		rect.y=(Sint16)y1;
		rect.w=(Uint16)(x2-x1);
		rect.h=(Uint16)(y2-y1);

		SDL_FillRect(g_Surface,&rect,c);
	}

	return 0;

}


// 把表面blt到背景或者前景表面
// x,y 要加载到表面的左上角坐标
int BlitSurface(SDL_Surface* lps, int x, int y ,int flag,int value)
{

	SDL_Surface *tmps;
	SDL_Rect rect;
	int i,j;

    Uint32 color=ConvertColor(g_MaskColor32);

	if(value>255)
		value=255;

	rect.x=(Sint16)x;
	rect.y=(Sint16)y;

	if((flag & 0x2)==0){        // 没有alpla
        SDL_BlitSurface(lps,NULL,g_Surface,&rect);
	}
    else{  // 有alpha
        if( (flag &0x4) || (flag &0x8)){   // 黑白
 		    int bpp=lps->format->BitsPerPixel;
		    //创建临时表面
    	    tmps=SDL_CreateRGBSurface(SDL_SWSURFACE,lps->w,lps->h,bpp,
		                          lps->format->Rmask,lps->format->Gmask,lps->format->Bmask,0);

		    SDL_FillRect(tmps,NULL,color);
	        SDL_SetColorKey(tmps,SDL_TRUE ,color);
            SDL_BlitSurface(lps,NULL,tmps,NULL);
            SDL_LockSurface(tmps);

            if(bpp==16){
                for(j=0;j<tmps->h;j++){
                    Uint16 *p=(Uint16*)((Uint8*)tmps->pixels+j*tmps->pitch);
                    for(i=0;i<tmps->w;i++){
                        if(*p!=(Uint16)color){
                            if(flag &0x4)
                                *p=0;
                            else
                                *p=0xffff;
                        }
                        p++;
                    }
                }
            }
            else if(bpp==32){
                for(j=0;j<tmps->h;j++){
                    Uint32 *p=(Uint32*)((Uint8*)tmps->pixels+j*tmps->pitch);
                    for(i=0;i<tmps->w;i++){
                        if(*p!=color){
                            if(flag &0x4)
                                *p=0;
                            else
                                *p=0xffffffff;
                        }
                        p++;
                    }
                }
            }
            else if(bpp==24){
                for(j=0;j<tmps->h;j++){
                    Uint8 *p=(Uint8*)tmps->pixels+j*tmps->pitch;
                    for(i=0;i<tmps->w;i++){
                        if((*p!=*(Uint8*)&color) &&  
                            (*(p+1) != *((Uint8*)&color+1)) &&
                            (*(p+2) != *((Uint8*)&color+2)) ){
                            if(flag &0x4){
                                *p=0;
                                *(p+1)=0;
                                *(p+2)=0;
                            }
                            else{
                                *p=0xff;
                                *(p+1)=0xff;
                                *(p+2)=0xff;
                            }
                        }
                        p+=3;
                    }
                }

            }

            SDL_UnlockSurface(tmps);

            SDL_SetSurfaceBlendMode(tmps, SDL_BLENDMODE_BLEND);
            SDL_SetSurfaceAlphaMod(tmps,(Uint8)value);

	        SDL_BlitSurface(tmps,NULL,g_Surface,&rect);

		    SDL_FreeSurface(tmps);
        }
        else{

            SDL_SetSurfaceBlendMode(lps, SDL_BLENDMODE_BLEND);
            SDL_SetSurfaceAlphaMod(lps,(Uint8)value);

	        SDL_BlitSurface(lps,NULL,g_Surface,&rect);
 
        }
	}
	
	return 0;
}


// 背景变暗
// 把源表面(x1,y1,x2,y2)矩形内的所有点亮度降低
// bright 亮度等级 0-256 
int JY_Background(int x1,int y1,int x2,int y2,int Bright)
{
    SDL_Surface* lps1; 
    SDL_Rect r1,r2; 

	if(x2<=x1 || y2<=y1) 
		return 0;

    Bright=256-Bright;
	if(Bright>255)
		Bright=255;

    r1.x=(Sint16)x1;
	r1.y=(Sint16)y1;
    r1.w=(Uint16)(x2-x1);
    r1.h=(Uint16)(y2-y1);

	if(g_Rotate==0){
		r2=r1;
	}
	else{
		r2=RotateRect(&r1);
	}


	lps1=SDL_CreateRGBSurface(SDL_SWSURFACE,r2.w,r2.h,g_Surface->format->BitsPerPixel,
		                      g_Surface->format->Rmask,g_Surface->format->Gmask,g_Surface->format->Bmask,0);


 
    SDL_FillRect(lps1,NULL,0);

    SDL_SetSurfaceBlendMode(lps1, SDL_BLENDMODE_BLEND);
    SDL_SetSurfaceAlphaMod(lps1,(Uint8)Bright);

	SDL_BlitSurface(lps1,NULL,g_Surface,&r2); 

	SDL_FreeSurface(lps1);
	return 1;
}

//播放mpeg
// esckey 停止播放的按键
int JY_PlayMPEG(const char* filename,int esckey)
{

#ifdef HAS_SDL_MPEG
     SMPEG_Info mpg_info;
     SMPEG* mpg = NULL;
	 char *err;
 
     mpg=SMPEG_new(filename,&mpg_info,0);
  
	 err=SMPEG_error(mpg);
	 if(err!=NULL){
		 JY_Error("Open file %s error: %s\n",filename,err);
		 return 1;
	 }
     

     SMPEG_setdisplay(mpg,g_Surface,NULL,NULL);
 
	 /* Play the movie, using SDL_mixer for audio */
	 SMPEG_enableaudio(mpg, 0);
	 if (g_EnableSound==1) {
		SDL_AudioSpec audiofmt;
		Uint16 format;
		int freq, channels;

		/* Tell SMPEG what the audio format is */
		Mix_QuerySpec(&freq, &format, &channels);
		audiofmt.format = format;
		audiofmt.freq = freq;
		audiofmt.channels = (Uint8)channels;
		SMPEG_actualSpec(mpg, &audiofmt);

		/* Hook in the MPEG music mixer */
		Mix_HookMusic(SMPEG_playAudioSDL, mpg);
		SMPEG_enableaudio(mpg, 1);
	}

     SMPEG_play(mpg);
  
     while( (SMPEG_status(mpg) == SMPEG_PLAYING)){
	     int key=JY_GetKey();
		 if(key==esckey){
             break;
		 }
         SDL_Delay(500);
	 }
 
    SMPEG_stop(mpg);
    SMPEG_delete(mpg);
    Mix_HookMusic(NULL, NULL);
#endif

	return 0;
} 


// 全屏切换
int JY_FullScreen()
{
    Uint32 flags = SDL_GetWindowFlags(g_Window);
    if(flags & SDL_WINDOW_FULLSCREEN){
        SDL_SetWindowFullscreen(g_Window, 0);
    }
    else{
        SDL_SetWindowFullscreen(g_Window, SDL_WINDOW_FULLSCREEN);
    }
    g_Surface = SDL_GetWindowSurface(g_Window);

    JY_ShowSurface(0);

    return 0;
}

//表面右转90度
SDL_Surface *RotateSurface(SDL_Surface *src)
{
    SDL_Surface *dest;    
	int i,j;


	dest=SDL_CreateRGBSurface(SDL_SWSURFACE,src->h,src->w,src->format->BitsPerPixel,
		                      src->format->Rmask,src->format->Gmask,src->format->Bmask,src->format->Amask);

	if(src->format->BitsPerPixel==8){
		SDL_SetPaletteColors(dest->format->palette,src->format->palette->colors,0,src->format->palette->ncolors);
	}
    
	SDL_LockSurface(src);
	SDL_LockSurface(dest);

	if(src->format->BitsPerPixel==32){
		for(j=0;j<src->h;j++){
			Uint32 *psrc=(Uint32*)((Uint8*)src->pixels+j*src->pitch);
			Uint8 *pdest=(Uint8*)dest->pixels+(src->h-j-1)*4;
			for(i=0;i<src->w;i++){
				*(Uint32*)pdest=*psrc;
				psrc++;
				pdest+=dest->pitch;
			}
		}
	}
	else if(src->format->BitsPerPixel==16){
		for(j=0;j<src->h;j++){
			Uint16 *psrc=(Uint16*)((Uint8*)src->pixels+j*src->pitch);
			Uint8 *pdest=(Uint8*)dest->pixels+(src->h-j-1)*2;
			for(i=0;i<src->w;i++){
				*(Uint16*)pdest=*psrc;
				psrc++;
				pdest+=dest->pitch;
			}
		}
	}

	else if(src->format->BitsPerPixel==24){
		for(j=0;j<src->h;j++){
			Uint8 *psrc=((Uint8*)src->pixels+j*src->pitch);
			Uint8 *pdest=(Uint8*)dest->pixels+(src->h-j-1)*3;
			for(i=0;i<src->w;i++){
				*pdest=*psrc;
				*(pdest+1)=*(psrc+1);
				*(pdest+2)=*(psrc+2);
				psrc+=3;
				pdest+=dest->pitch;
			}
		}
	}
	else if(src->format->BitsPerPixel==8){
		for(j=0;j<src->h;j++){
			Uint8 *psrc=((Uint8*)src->pixels+j*src->pitch);
			Uint8 *pdest=(Uint8*)dest->pixels+(src->h-j-1);
			for(i=0;i<src->w;i++){
				*pdest=*psrc;
				psrc++;
				pdest+=dest->pitch;
			}
		}
	}

    SDL_UnlockSurface(src);
	SDL_UnlockSurface(dest);

	{
		Uint32 key;
		if(SDL_GetColorKey(src, &key) == 0){
			SDL_SetColorKey(dest, SDL_TRUE, key);
			SDL_SetSurfaceRLE(dest, 1);
		}
	}


	return dest;
    
}

//矩形右转90度
SDL_Rect RotateRect(const SDL_Rect *rect)
{
    SDL_Rect r;
	r.x=(Sint16)(g_ScreenH-rect->y-rect->h);
	r.y=rect->x;
	r.w=rect->h;
	r.h=rect->w;
	return r;
}

//矩形左转90度
SDL_Rect RotateReverseRect(const SDL_Rect *rect)
{
    SDL_Rect r;
	r.x=rect->y; 
	r.y=(Sint16)(g_ScreenH-rect->x-rect->w);
	r.w=rect->h;
	r.h=rect->w;
	return r;
}