
//绘制主地图、场景地图和战斗地图
//为加快速度，这些函数改为c中实现

#include <stdlib.h> 
#include "jymain.h"

 
//主地图数据
static Sint16  *pEarth=NULL;
static Sint16  *pSurface=NULL;
static Sint16  *pBuilding=NULL;
static Sint16  *pBuildX=NULL;
static Sint16  *pBuildY=NULL;

static Sint16 *tmp_M=NULL;

//主地图文件名
static FILE *fpEarth=NULL;
static FILE *fpSurface=NULL;
static FILE *fpBuilding=NULL;
static FILE *fpBuildX=NULL;
static FILE *fpBuildY=NULL;


static int M_XMax,M_YMax;  //主地图大小

static int M_X0,M_Y0;     //部分读取主地图的起始坐标
static int M_Scope;       //部分读取主地图时的坐标范围。每次显示主地图访问坐标范围为此值的两倍。而预读的主地图范围为4倍。
static int old_M_Y0=-1;
 
static int BuildNumber;     //实际排序个数

static BuildingType Build[2000];        // 建筑排序数组
  
static int S_XMax,S_YMax;      // 场景地图大小
static int S_Num;
static Sint16 *pS=NULL;              // 场景S*数据

// 为减少内存占用，对S文件采用临时文件方式访问，只在内存中保存当前场景的S数据
static char TempS_filename[255];     //临时S文件名
static int currentS=-1;              //当前加载的场景S数据

static int D_Num1;             // 每个场景D的个数
static int D_Num2;             // 每个D的数据个数

static Sint16 *pD=NULL;              // 场景D*数据

static int War_XMax,War_YMax;      // 战斗地图大小
static int War_Num;                // 战斗地图层数
static Sint16 *pWar=NULL;           // 战斗地图数据

extern SDL_Surface* g_Surface;        // 游戏使用的视频表面 

extern int g_Rotate;

extern int g_ScreenW;
extern int g_ScreenH;

extern int g_XScale;
extern int g_YScale;  

extern int g_MMapAddX;
extern int g_MMapAddY;
extern int g_SMapAddX;
extern int g_SMapAddY;
extern int g_WMapAddX;
extern int g_WMapAddY;


extern int g_LoadFullS;
extern int g_LoadMMapType;
extern int g_LoadMMapScope; 

// 读取主地图数据
int JY_LoadMMap(const char* earthname, const char* surfacename, const char*buildingname,
				const char* buildxname, const char* buildyname, int x_max, int y_max,int x,int y)
{


    M_XMax=x_max;
	M_YMax=y_max;

    JY_UnloadMMap();

	if(g_LoadMMapType==0){   //全部读取
	    LoadMMap_Sub(earthname,&pEarth);
		LoadMMap_Sub(surfacename,&pSurface);
		LoadMMap_Sub(buildingname,&pBuilding);
		LoadMMap_Sub(buildxname,&pBuildX);
		LoadMMap_Sub(buildyname,&pBuildY);
	}
	else{                  //部分读取

		int rangex=g_ScreenW/(2*g_XScale)/2+1+g_MMapAddX;   //计算主地图访问坐标范围
		int rangey=g_ScreenH/(2*g_YScale)/2+1;
		
		M_Scope=rangex+rangey+g_MMapAddY+5;       
		if(g_LoadMMapScope>M_Scope){
			M_Scope=g_LoadMMapScope;
		}

		old_M_Y0=-1;

		JY_Debug("Load MMap Scope=%d",M_Scope);

		if((fpEarth=fopen(earthname,"rb"))==NULL){         //打开主地图文件句柄
			JY_Error("file not open ---%s",earthname);
			return 1;
		}
		if((fpSurface=fopen(surfacename,"rb"))==NULL){
			JY_Error("file not open ---%s",surfacename);
			return 1;
		}
		if((fpBuilding=fopen(buildingname,"rb"))==NULL){
			JY_Error("file not open ---%s",buildingname);
			return 1;
		}
		if((fpBuildX=fopen(buildxname,"rb"))==NULL){
			JY_Error("file not open ---%s",buildxname);
			return 1;
		}
		if((fpBuildY=fopen(buildyname,"rb"))==NULL){
			JY_Error("file not open ---%s",buildyname);
			return 1;
		}
        LoadMMap_Part(1,  x,  y);   //部分读取主地图
	}

    return 0;

}

//全部读取主地图 
int LoadMMap_Sub(const char*filename,Sint16 **p)
{
	FILE *fp;
    
	if(*p==NULL){
        *p=(Sint16*) malloc(M_XMax*M_YMax*2);
	}

	if((fp=fopen(filename,"rb"))==NULL){
        JY_Error("file not open ---%s",filename);
		return 1;
	}

    fread(*p,2,M_XMax*M_YMax,fp);
	fclose(fp);

    return 0;
}



//部分读取主地图数据
// read 0 根据需要读取  1 强制读取
int LoadMMap_Part(int read,int x,int y)
{
	int x1,y1,x2,y2;

	if(read==0){  //计算是否需要读取主地图数据
		x1=limitX(x-M_Scope,0,M_XMax-1);     //显示地图时读取的左上角和右下角坐标
		y1=limitX(y-M_Scope,0,M_YMax-1);
		x2=limitX(x+M_Scope,0,M_XMax-1);
		y2=limitX(y+M_Scope,0,M_YMax-1);

		if(g_LoadMMapType==1){
			if(x1<0 || y1<M_Y0 || x2 >= M_XMax || y2>=M_Y0+4*M_Scope){  //坐标超出范围，需要读取
				read=1;
			}
		}
		else if(g_LoadMMapType==2){
			if(x1<M_X0 || y1<M_Y0 || x2 >= M_X0+4*M_Scope || y2>=M_Y0+4*M_Scope){  
				read=1;
			}
		}
	}

	if(read==1){
		if(g_LoadMMapType==1){
			M_X0=0;
		}
		else{
		    M_X0=limitX(x-2*M_Scope,0,M_XMax-4*M_Scope);  //读取主地图的左上角坐标
		}
		M_Y0=limitX(y-2*M_Scope,0,M_YMax-4*M_Scope);

		LoadMMap_Part_Sub(fpEarth,&pEarth);
		LoadMMap_Part_Sub(fpSurface,&pSurface);
		LoadMMap_Part_Sub(fpBuilding,&pBuilding);
		LoadMMap_Part_Sub(fpBuildX,&pBuildX);
		LoadMMap_Part_Sub(fpBuildY,&pBuildY);
		old_M_Y0=M_Y0;
	}

	return 0;
}


int LoadMMap_Part_Sub(FILE *fp,Sint16 **p)    //部分读取每个主地图
{
	int i;

	if(g_LoadMMapType==1){   //方法1：读取当前附近行
		if(*p==NULL){
			*p=(Sint16*) malloc(4*M_Scope*M_XMax*2);
		}

		if(old_M_Y0<0){    //没有以前的数据，第一次读取。     
	        fseek(fp,M_Y0*M_XMax*2,SEEK_SET); 
            fread(*p,2,4*M_Scope*M_XMax,fp);  
		}
		else{
			int dy=M_Y0-old_M_Y0;
			if(dy>0){    //坐标增加
				memmove(*p,*p+dy*M_XMax,(4*M_Scope-dy)*M_XMax*2);    //复制原来内存中数据到新地址
				fseek(fp,(4*M_Scope+old_M_Y0)*M_XMax*2,SEEK_SET); 
				fread(*p+(4*M_Scope-dy)*M_XMax,2,dy*M_XMax,fp);      //从文件读取剩余需要的数据
			}
			else{
				memmove(*p+(-dy)*M_XMax,*p,(4*M_Scope+dy)*M_XMax*2);
				fseek(fp,M_Y0*M_XMax*2,SEEK_SET); 
				fread(*p,2,(-dy)*M_XMax,fp);
			}
		}
	}
	else if(g_LoadMMapType==2){  //方法1：读取当前附近行和列
		if(*p==NULL){
			*p=(Sint16*) malloc(4*M_Scope*4*M_Scope*2);
		}
 
		//读取当前附近行数据到临时内存。在手机上，这样做比逐行读取一段数据速度快很多(难道flash读取和硬盘不一样？)
		if(tmp_M==NULL){
			tmp_M=(Sint16*) malloc(4*M_Scope*M_XMax*2);
		}
		fseek(fp,M_Y0*M_XMax*2,SEEK_SET);	 
	    fread(tmp_M,2,4*M_Scope*M_XMax,fp);	 

		//复制需要的数据
		for(i=0;i<4*M_Scope;i++){
			memcpy(*p+i*4*M_Scope,tmp_M+i*M_XMax+M_X0,4*M_Scope*2);
		}

	}
 
    return 0;
}



// 释放主地图数据
int JY_UnloadMMap(void)
{
    SafeFree(pEarth);
    SafeFree(pSurface);
    SafeFree(pBuilding);
    SafeFree(pBuildX);
    SafeFree(pBuildY);

    SafeFree(tmp_M);

	if(fpEarth!=NULL){
		fclose(fpEarth);
		fpEarth=NULL;
	}
	if(fpSurface!=NULL){
		fclose(fpSurface);
		fpSurface=NULL;
	}
	if(fpBuilding!=NULL){
		fclose(fpBuilding);
		fpBuilding=NULL;
	}
	if(fpBuildX!=NULL){
		fclose(fpBuildX);
		fpBuildX=NULL;
	}
	if(fpBuildY!=NULL){
		fclose(fpBuildY);
		fpBuildY=NULL;
	}

    return 0;
}

// 得到主地图数据偏移地址。如果超出当前内存的数据范围，返回-1
static int GetMMapOffset(int x,int y)
{
	int s;
	if(g_LoadMMapType==0){
		if( x<0 || x>=M_XMax || y <0 || y>=M_YMax){
			return -1;
		}
		s=y*M_XMax+x;
	}
	else if(g_LoadMMapType==1){
		if( x<M_X0|| x>=M_XMax|| y <M_Y0 || y>=M_Y0 +4*M_Scope){
			return -1;
		}
		s=(y-M_Y0)*M_XMax+(x-M_X0);
	}
	else{
		if( x<M_X0|| x>=M_X0+4*M_Scope || y <M_Y0 || y>=M_Y0 +4*M_Scope){
			return -1;
		}
	    s=(y-M_Y0)*4*M_Scope+(x-M_X0);
	}
	return s;
}

// 取主地图数据 
// flag  0 earth, 1 surface, 2 building, 3 buildx, 4 buildy
int JY_GetMMap(int x, int y , int flag)
{
	int s;
	int v=0;
	
    s=GetMMapOffset(x,y);
	if(s<0){
		JY_Error("JY_GetMMap: input data out of range x=%d,y=%d,flag=%d",x,y,flag);
		return 0;
	}

	switch(flag)
	{
	case 0:
        v=pEarth[s];
		break;
	case 1:
        v=pSurface[s];
		break;
	case 2:
        v=pBuilding[s];
		break;
	case 3:
        v=pBuildX[s];
		break;
	case 4:
        v=pBuildY[s];
		break;
   }
	return v;

}

// 存主地图数据 
// flag  0 earth, 1 surface, 2 building, 3 buildx, 4 buildy
int JY_SetMMap(short x, short y , int flag, short v)
{
	int s;
	
    s=GetMMapOffset(x,y);
	if(s<0){
		JY_Error("JY_SetMMap: input data out of range x=%d,y=%d,flag=%d",x,y,flag);
		return 0;
	}

	switch(flag)
	{
	case 0:
        pEarth[s]=v;
		break;
	case 1:
        pSurface[s]=v;
		break;
	case 2:
        pBuilding[s]=v;
		break;
	case 3:
        pBuildX[s]=v;
		break;
	case 4:
        pBuildY[s]=v;
		break;
   }
	return 0;
}


// 主地图建筑排序 
// x,y 主角坐标
// Mypic 主角贴图编号
int BuildingSort(short x, short y, short Mypic)
{

    int rangex=g_ScreenW/(2*g_XScale)/2+1+g_MMapAddX;
	int rangey=g_ScreenH/(2*g_YScale)/2+1;

	int range=rangex+rangey+g_MMapAddY;

	short bak=(short)JY_GetMMap(x,y,2);
	short bakx=(short)JY_GetMMap(x,y,3);
	short baky=(short)JY_GetMMap(x,y,4);
    
	int xmin=limitX(x-range,1,M_XMax-1);
	int xmax=limitX(x+range,1,M_XMax-1);
	int ymin=limitX(y-range,1,M_YMax-1);
	int ymax=limitX(y+range,1,M_YMax-1);

    int i,j,k,m;
    int dy;
	int repeat=0;
	int p=0;

	BuildingType tmpBuild;

    JY_SetMMap(x,y,2,(short)(Mypic*2));
    JY_SetMMap(x,y,3,x);
    JY_SetMMap(x,y,4,y);

	for(i=xmin;i<=xmax;i++){
		dy=ymin;
		for(j=ymin;j<=ymax;j++){
			int ij3=JY_GetMMap(i,j,3);
			int ij4=JY_GetMMap(i,j,4);
			if( (ij3!=0) && (ij4!=0)){
				repeat=0;
				for(k=0;k<p;k++){
					if((Build[k].x ==ij3) && (Build[k].y==ij4)){
						repeat =1;
						if(k==p-1)
							break;

						for(m=j-1;m>=dy;m--){
							int im3=JY_GetMMap(i,m,3);
							int im4=JY_GetMMap(i,m,4);
							if( (im3!=0) && (im4!=0)){
								if( (im3!=ij3) || (im4!=ij4)){
								    if( (im3!=Build[k].x) || (im4!=Build[k].y)){
										tmpBuild=Build[p-1];
										memmove(&Build[k+1],&Build[k],(p-2-k+1)*sizeof(BuildingType));
										Build[k]=tmpBuild;										 
									}
								}
							}
						}
						dy=j+1;
						break;
					}
				}

				if(repeat==0){
					Build[p].x =ij3;
					Build[p].y =ij4;
					Build[p].num =JY_GetMMap(Build[p].x,Build[p].y,2);
					p++;
				}
			}
		}
	}

    BuildNumber=p;

    JY_SetMMap(x,y,2,bak);
    JY_SetMMap(x,y,3,bakx);
    JY_SetMMap(x,y,4,baky);   

    return 0;
}



// 绘制主地图
int JY_DrawMMap(int x, int y, int Mypic)
{

	int i,j;
	int i1,j1;
	int x1,y1;
    int picnum;
	int istart,iend,jstart,jend;

	SDL_Rect rect;
	 
	if(g_Rotate==0){
		rect=g_Surface->clip_rect;
	}
	else{
	    rect=RotateReverseRect(&g_Surface->clip_rect);
	}

	//根据g_Surface的clip来确定循环参数。提高绘制速度
	istart=(rect.x-g_ScreenW/2)/(2*g_XScale)-1-g_MMapAddX;
	iend=(rect.x+rect.w -g_ScreenW/2)/(2*g_XScale)+1+g_MMapAddX;

    jstart=(rect.y-g_ScreenH/2)/(2*g_YScale)-1;
    jend=(rect.y+rect.h -g_ScreenH/2)/(2*g_YScale)+1;

    BuildNumber=0;

	if(g_LoadMMapType!=0){   //部分读取主地图，则根据需要重新读取数据
        LoadMMap_Part(0,x,y);
	}

	//建筑排序
    BuildingSort((short)x, (short)y, (short)Mypic);

	JY_FillColor(0,0,0,0,0);

 	for(j=0;j<=2*jend-2*jstart+g_MMapAddY;j++){
	    for(i=istart;i<=iend;i++){
            i1=i+j/2+jstart;
			j1=-i+j/2+j%2+jstart;
             
            x1=g_XScale*(i1-j1)+g_ScreenW/2;
			y1=g_YScale*(i1+j1)+g_ScreenH/2;

			if( ((x+i1)>=0) && ((x+i1)<M_XMax) && ((y+j1)>=0) && ((y+j1)<M_YMax) ){
				picnum=JY_GetMMap(x+i1,y+j1,0);
				if(picnum>0){
                    JY_LoadPic(0,picnum,x1,y1,0,0);
				}
				picnum=JY_GetMMap(x+i1,y+j1,1);
				if(picnum>0){
                    JY_LoadPic(0,picnum,x1,y1,0,0);
				}
                     		
			}
		}
	}

	for(i=0;i<BuildNumber;i++){
        i1=Build[i].x -x;
		j1=Build[i].y -y;
        x1=g_XScale*(i1-j1)+g_ScreenW/2;
	    y1=g_YScale*(i1+j1)+g_ScreenH/2;
		picnum=Build[i].num ;
		if(picnum>0){
			JY_LoadPic(0,picnum,x1,y1,0,0);
		}
	}

    return 0;
}


//读取S*D*
int JY_LoadSMap(const char *Sfilename,const char*tmpfilename, int num,int x_max,int y_max,
				const char *Dfilename,int d_num1,int d_num2)
{
    FILE *fp,*fp2;
    int i; 

    S_XMax=x_max;
	S_YMax=y_max;
    S_Num=num;

	//读取S文件
    if(g_LoadFullS==0){     //读取s到临时文件
        strcpy(TempS_filename,tmpfilename);  
        if(pS==NULL)
            pS=(Sint16*) malloc(S_XMax*S_YMax*6*2);

	    if(pS==NULL){
		    JY_Error("JY_LoadSMap error: can not malloc memory\n");
		    return 0;
	    }

	    if((fp=fopen(Sfilename,"rb"))==NULL){
            JY_Error("JY_LoadSMap error:file not open ---%s",Sfilename);
		    return 0;
	    }
	    if((fp2=fopen(TempS_filename,"wb"))==NULL){
            JY_Error("JY_LoadSMap error:file not open ---%s",TempS_filename);
		    return 0;
	    }
        for(i=0;i<S_Num;i++){
            fread(pS,2,S_XMax*S_YMax*6,fp);
            fwrite(pS,2,S_XMax*S_YMax*6,fp2);
        }
	    fclose(fp);
        fclose(fp2);
        currentS=-1;
    }
    else{      //全部读入内存
        if(pS==NULL)
            pS=(Sint16*) malloc(S_XMax*S_YMax*6*2*S_Num);

	    if(pS==NULL){
		    JY_Error("JY_LoadSMap error: can not malloc memory\n");
		    return 0;
	    }

	    if((fp=fopen(Sfilename,"rb"))==NULL){
            JY_Error("JY_LoadSMap error:file not open ---%s",Sfilename);
		    return 0;
	    }
        fread(pS,2,S_XMax*S_YMax*6*S_Num,fp); 
	    fclose(fp);
    }
        
    D_Num1=d_num1;
	D_Num2=d_num2;
	
    //读取D文件
  

	if(pD==NULL)
        pD=(Sint16*) malloc(D_Num1*D_Num2*S_Num*2);
	if(pD==NULL){
		JY_Error("JY_LoadSMap error: can not malloc memory\n");
		return 0;
	}

	if((fp=fopen(Dfilename,"rb"))==NULL){
        JY_Error("JY_LoadSMap error:file not open ---%s",Dfilename);
		return 0;
	}
    fread(pD,2,D_Num1*D_Num2*S_Num,fp);
	fclose(fp);

    return 0;
}

//保存S*D*
int JY_SaveSMap(const char *Sfilename,const char *Dfilename)
{
    FILE *fp,*fp2;
    int i; 
    
	if(pS==NULL)
		return 0;

    if(g_LoadFullS==0){    //读取部分S时的保存
        WriteS(currentS);
        currentS=-1;
	    if((fp=fopen(Sfilename,"wb"))==NULL){
            JY_Error("file not open ---%s",Sfilename);
		    return 0;
	    }
	    if((fp2=fopen(TempS_filename,"rb"))==NULL){
            JY_Error("JY_LoadSMap error:file not open ---%s",TempS_filename);
		    return 0;
	    }
        for(i=0;i<S_Num;i++){
            fread(pS,2,S_XMax*S_YMax*6,fp2);
            fwrite(pS,2,S_XMax*S_YMax*6,fp);
        }
	    fclose(fp);
        fclose(fp2);
    }
    else{
	    if((fp=fopen(Sfilename,"wb"))==NULL){
            JY_Error("file not open ---%s",Sfilename);
		    return 0;
	    }
 
        fwrite(pS,2,S_XMax*S_YMax*6*S_Num,fp);
 	    fclose(fp);
    }


	if(pD==NULL)
		return 0;
    
	if((fp=fopen(Dfilename,"wb"))==NULL){
        JY_Error("file not open ---%s",Dfilename);
		return 0;
	}
 
    fwrite(pD,2,D_Num1*D_Num2*S_Num,fp);
    fclose(fp);

    return 0;
}

int JY_UnloadSMap()
{
	SafeFree(pS);
	SafeFree(pD);

    return 0;
}

//从临时文件中读取场景id的S数据到内存
int ReadS(int id)
{
    FILE *fp;
    if(id<0 || id>=S_Num)
        return 1;

	if((fp=fopen(TempS_filename,"rb"))==NULL){
        JY_Error("JY_LoadSMap error:file not open ---%s",TempS_filename);
		return 0;
	}
    fseek(fp,S_XMax*S_YMax*6*2*id,SEEK_SET);
    fread(pS,2,S_XMax*S_YMax*6,fp);
 	fclose(fp);
    
    return 0;
}

//从内存中写入场景id的S数据到临时文件
int WriteS(int id)
{
    FILE *fp;
    if(id<0 || id>=S_Num)
        return 1;

	if((fp=fopen(TempS_filename,"r+b"))==NULL){
        JY_Error("JY_LoadSMap error:file not open ---%s",TempS_filename);
		return 0;
	}
    fseek(fp,S_XMax*S_YMax*6*2*id,SEEK_SET);
    fwrite(pS,2,S_XMax*S_YMax*6,fp);
 	fclose(fp);
    
    return 0;
}

//取s的值
int JY_GetS(int id,int x,int y,int level)
{
    int s;
	if(id<0 || id>=S_Num || x<0 || x>=S_XMax || y<0 || y>=S_YMax || level <0 || level >=6){
        JY_Error("GetS error: data out of range! id=%d,x=%d,y=%d,level=%d\n",id,x,y,level);
        return 0;
	}
    if(g_LoadFullS==0){    
        if(id!=currentS){
            WriteS(currentS);
            ReadS(id);
            currentS=id;
        }
        s=S_XMax*S_YMax*level+y*S_XMax+x;
    }
    else{
        s=S_XMax*S_YMax*(id*6+level)+y*S_XMax+x;
    }
 	return *(pS+s);

}

//存S的值
int JY_SetS(int id,int x,int y,int level,int v)
{
    FILE *fp;
    int s;
    short value=(short)v;
 	if(id<0 || id>=S_Num || x<0 || x>=S_XMax || y<0 || y>=S_YMax || level <0 || level >=6){
        JY_Error("GetS error: data out of range! id=%d,x=%d,y=%d,level=%d\n",id,x,y,level);
        return 0;
	}

    if(g_LoadFullS==0){ 
        if(id==currentS){
            s=S_XMax*S_YMax*level+y*S_XMax+x;
	        *(pS+s)=value;
        }
        else{
	        if((fp=fopen(TempS_filename,"r+b"))==NULL){
                JY_Error("JY_LoadSMap error:file not open ---%s",TempS_filename);
		        return 0;
	        }
            fseek(fp,(S_XMax*S_YMax*(id*6+level)+y*S_XMax+x)*2,SEEK_SET);
            fwrite(&value,2,1,fp);
 	        fclose(fp);
        }
    }
    else{
        s=S_XMax*S_YMax*(id*6+level)+y*S_XMax+x;
        *(pS+s)=value;
    }
  
	return 0;

}

//取D*
int JY_GetD(int Sceneid,int id,int i)
{
    int s;
    if(Sceneid<0 || Sceneid>=S_Num){
        JY_Error("GetD error: sceneid=%d out of range!\n",Sceneid);
        return 0;
    }

    s=D_Num1*D_Num2*Sceneid+id*D_Num2+i;

	return *(pD+s);
}

//存D*
int JY_SetD(int Sceneid,int id,int i,int v)
{
    int s;
    if(Sceneid<0 || Sceneid>=S_Num){
        JY_Error("GetD error: sceneid=%d out of range!\n",Sceneid);
        return 0;
    }

    s=D_Num1*D_Num2*Sceneid+id*D_Num2+i;

	*(pD+s)=(short)v;

	return 0;
}


// 绘制场景地图
int JY_DrawSMap(int sceneid,int x, int y,int xoff,int yoff, int Mypic)
{

    //int rangex=g_ScreenW/(2*g_XScale)/2+1+g_SMapAddX;
	//int rangey=(g_ScreenH)/(2*g_YScale)/2+1;
	int i,j;
	int i1,j1;
	int x1,y1;

	int xx,yy;
	int istart,iend,jstart,jend;

	SDL_Rect rect;
	 
	if(g_Rotate==0){
		rect=g_Surface->clip_rect;
	}
	else{
	    rect=RotateReverseRect(&g_Surface->clip_rect);
	}

	//根据g_Surface的剪裁来确定循环参数。提高绘制速度
	istart=(rect.x-g_ScreenW/2)/(2*g_XScale)-1-g_SMapAddX;
	iend=(rect.x+rect.w -g_ScreenW/2)/(2*g_XScale)+1+g_SMapAddX;

    jstart=(rect.y-g_ScreenH/2)/(2*g_YScale)-1;
    jend=(rect.y+rect.h -g_ScreenH/2)/(2*g_YScale)+1;

	JY_FillColor(0,0,0,0,0);

 	for(j=0;j<=2*jend-2*jstart+g_SMapAddY;j++){
	    for(i=istart;i<=iend;i++){
            i1=i+j/2+jstart;
			j1=-i+j/2+j%2+jstart;

     
            x1=g_XScale*(i1-j1)+g_ScreenW/2;
			y1=g_YScale*(i1+j1)+g_ScreenH/2;

			xx=x+i1+xoff;
			yy=y+j1+yoff;

			if( (xx>=0) && (xx<S_XMax) && (yy>=0) && (yy<S_YMax) ){
                int d0=JY_GetS(sceneid,xx,yy,0);
				if(d0>0){
                      JY_LoadPic(0,d0,x1,y1,0,0);             //地面
				}
			}
		}
	}

 	for(j=0;j<=2*jend-2*jstart+g_SMapAddY;j++){
	    for(i=istart;i<=iend;i++){
            i1=i+j/2+jstart;
			j1=-i+j/2+j%2+jstart;
           
            x1=g_XScale*(i1-j1)+g_ScreenW/2;
			y1=g_YScale*(i1+j1)+g_ScreenH/2;

			xx=x+i1+xoff;
			yy=y+j1+yoff;

			if( (xx>=0) && (xx<S_XMax) && (yy>=0) && (yy<S_YMax) ){
                int d1=JY_GetS(sceneid,xx,yy,1);
                int d2=JY_GetS(sceneid,xx,yy,2);
                int d3=JY_GetS(sceneid,xx,yy,3);
                int d4=JY_GetS(sceneid,xx,yy,4);
                int d5=JY_GetS(sceneid,xx,yy,5);
      
				if(d1>0){
                      JY_LoadPic(0,d1,x1,y1-d4,0,0);           //建筑
				}
				if(d2>0){
                     JY_LoadPic(0,d2,x1,y1-d5,0,0);          //空中
				} 
				if(d3>=0){           // 事件
					int picnum=JY_GetD(sceneid,d3,7);
					if(picnum>0){
                       JY_LoadPic(0,picnum,x1,y1-d4,0,0);
					}
				}

				if( (i1==-xoff) && (j1==-yoff) ){  //主角
                       JY_LoadPic(0,Mypic*2,x1,y1-d4,0,0);
				}
			}
		}
	}

    return 0;
}

//加载战斗地图
// WarIDXfilename/WarGRPfilename 战斗地图idx/grp文件名
// mapid 战斗地图编号
// num 战斗地图数据层数   应为6
//         0层 地面数据
//         1层 建筑
//         2层 战斗人战斗编号
//         3层 移动时显示可移动的位置
//         4层 命中效果
//         5层 战斗人对应的贴图
// x_max,x_max   地图大小
int JY_LoadWarMap(const char *WarIDXfilename,const char *WarGRPfilename, int mapid,int num, int x_max,int y_max)
{
    FILE *fp;
	int p;

    War_XMax=x_max;
	War_YMax=y_max;
	War_Num=num;

    JY_UnloadWarMap();

    if(pWar==NULL)
	    pWar=(Sint16*) malloc(x_max*y_max*num*2);

	if(pWar==NULL){
		JY_Error("JY_LoadWarMap error: can not malloc memory\n");
		return 0;
	}

	if(mapid==0){        //第0个地图，从0开始读
		p=0;
	}
	else{
		if((fp=fopen(WarIDXfilename,"rb"))==NULL){      //读idx文件
            JY_Error("file not open ---%s",WarIDXfilename);
		    return 0;
		}
        fseek(fp,4*(mapid-1),SEEK_SET);
        fread(&p,4,1,fp);
	    fclose(fp);
	};


	if((fp=fopen(WarGRPfilename,"rb"))==NULL){
        JY_Error("file not open ---%s",WarIDXfilename);
		return 0;
	}
    fseek(fp,p,SEEK_SET);
    fread(pWar,2,x_max*y_max*2,fp);
	fclose(fp);

	return 0;

}

int JY_UnloadWarMap()
{
    
    SafeFree(pWar);
 
    return 0;
}

//取战斗地图数据
int JY_GetWarMap(int x,int y,int level)
{
    int s;

	if(x<0 || x>=War_XMax || y<0 || y>=War_YMax || level <0 || level >=6){
        JY_Error("GetWarMap error: data out of range! x=%d,y=%d,level=%d\n",x,y,level);
        return 0;
	}

	s=War_XMax*War_YMax*level+y*War_XMax+x;

	return *(pWar+s);

}

//存战斗地图数据
int JY_SetWarMap(int x,int y,int level,int v)
{
   int s;

	if(x<0 || x>=War_XMax || y<0 || y>=War_YMax || level <0 || level >=6){
        JY_Error("GetWarMap error: data out of range! x=%d,y=%d,level=%d\n",x,y,level);
        return 0;
	}

	s=War_XMax*War_YMax*level+y*War_XMax+x;

	*(pWar+s)=(short)v;

	return 0;

}

//设置某层战斗地图为给定值
int JY_CleanWarMap(int level,int v)
{
    short *p=pWar+War_XMax*War_YMax*level;
    int i;
    for(i=0;i<War_XMax*War_YMax;i++){
        *p=(short)v;
        p++;
    }
    return 0;  
} 

// 绘制战斗地图
// flag=0  绘制基本战斗地图
//     =1  显示可移动的路径，(v1,v2)当前移动坐标，白色背景(雪地战斗)
//     =2  显示可移动的路径，(v1,v2)当前移动坐标，黑色背景
//     =3  命中的人物用白色轮廓显示
//     =4  战斗动作动画  v1 战斗人物pic, v2贴图所属的加载文件id
//                       v3 武功效果pic  -1表示没有武功效果

int JY_DrawWarMap(int flag, int x, int y, int v1,int v2,int v3)
{

    //int rangex=g_ScreenW/(2*g_XScale)/2+1+g_WMapAddX;
	//int rangey=g_ScreenH/(2*g_YScale)/2+1 ;
	int i,j;
	int i1,j1;
	int x1,y1;
 
 
	int xx,yy;

	int istart,iend,jstart,jend;

	SDL_Rect rect;
	 
	if(g_Rotate==0){
		rect=g_Surface->clip_rect;
	}
	else{
	    rect=RotateReverseRect(&g_Surface->clip_rect);
	}

	//根据g_Surface的剪裁来确定循环参数。提高绘制速度
	istart=(rect.x-g_ScreenW/2)/(2*g_XScale)-1-g_WMapAddX;
	iend=(rect.x+rect.w -g_ScreenW/2)/(2*g_XScale)+1+g_WMapAddX;

    jstart=(rect.y-g_ScreenH/2)/(2*g_YScale)-1;
    jend=(rect.y+rect.h -g_ScreenH/2)/(2*g_YScale)+1;

	JY_FillColor(0,0,0,0,0);

 
    // 绘战斗地面
	for(j=0;j<=2*jend-2*jstart+g_WMapAddY;j++){
	    for(i=istart;i<=iend;i++){
            i1=i+j/2+jstart;
			j1=-i+j/2+j%2+jstart;	
   
            x1=g_XScale*(i1-j1)+g_ScreenW/2;
			y1=g_YScale*(i1+j1)+g_ScreenH/2;
			xx=x+i1 ;
			yy=y+j1 ;
			if( (xx>=0) && (xx<War_XMax) && (yy>=0) && (yy<War_YMax) ){
                int num=JY_GetWarMap(xx,yy,0);            
                if(num>0)
 					JY_LoadPic(0,num,x1,y1,0,0);     //地面
			}
		}
	}

if( (flag==1) || (flag==2) ){     //在地面上绘制移动范围
	for(j=0;j<=2*jend-2*jstart+g_WMapAddY;j++){
	    for(i=istart;i<=iend;i++){
            i1=i+j/2+jstart;
			j1=-i+j/2+j%2+jstart;	
    
            x1=g_XScale*(i1-j1)+g_ScreenW/2;
			y1=g_YScale*(i1+j1)+g_ScreenH/2;
			xx=x+i1 ;
			yy=y+j1 ;
			if( (xx>=0) && (xx<War_XMax) && (yy>=0) && (yy<War_YMax) ){
				if(JY_GetWarMap(xx,yy,3)<128){
					int showflag;
					if(flag==1)
						showflag=2+4;
					else
						showflag=2+8;

					if((xx==v1)&&(yy==v2))
 
                        JY_LoadPic(0,0,x1,y1,showflag,128);    
					else
   					    JY_LoadPic(0,0,x1,y1,showflag,64);

                }

			}
		}
	}
}

    // 绘战斗建筑和人
	for(j=0;j<=2*jend-2*jstart+g_WMapAddY;j++){
	    for(i=istart;i<=iend;i++){
            i1=i+j/2+jstart;
			j1=-i+j/2+j%2+jstart;	
    
            x1=g_XScale*(i1-j1)+g_ScreenW/2;
			y1=g_YScale*(i1+j1)+g_ScreenH/2;
			xx=x+i1 ;
			yy=y+j1 ;
			if( (xx>=0) && (xx<War_XMax) && (yy>=0) && (yy<War_YMax) ){
                int num=JY_GetWarMap(xx,yy,1);    //  建筑      
                if(num>0)
                	JY_LoadPic(0,num,x1,y1,0,0);

				num=JY_GetWarMap(xx,yy,2);        // 战斗人
				if(num>=0){
                    int pic=JY_GetWarMap(xx,yy,5);  // 人贴图
					if(pic>=0){
						switch(flag){
						case 0:
						case 1:
						case 2:  
                        case 5: //人物常规显示
							JY_LoadPic(0,pic,x1,y1,0,0);
							break;
						case 3:
							if(JY_GetWarMap(xx,yy,4)>1)   //命中
  							    JY_LoadPic(0,pic,x1,y1,4+2,255);  //变黑
							else
							    JY_LoadPic(0,pic,x1,y1,0,0);

							break;
						case 4:
							if( (xx==x) && (yy==y) ){
                                if(v2==0)
								    JY_LoadPic(0,pic,x1,y1,0,0);
                                else
 							        JY_LoadPic(v2,v1,x1,y1,0,0);
                            }
							else{
								 JY_LoadPic(0,pic,x1,y1,0,0);
							}

							break;
						}
					}
				}
                
                if(flag==4 && v3>=0){   //武功效果
	                 int effect=JY_GetWarMap(xx,yy,4);
				    if(effect>0){
                         JY_LoadPic(3,v3,x1,y1,0,0);
				    }
                }


			}
		}
	}
    return 0;
}