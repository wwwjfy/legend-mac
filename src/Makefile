SDLFLAG=`pkg-config --cflags --libs sdl`
LUAFLAG=`pkg-config --cflags --libs lua5.2`
OTHERFLAG= -lSDL_ttf -lSDL_image -lSDL_mixer -lsmpeg 
RM= rm -rf
all:
	gcc *.c -o ../bin/jy $(LUAFLAG) $(SDLFLAG) $(OTHERFLAG)

clean:
	$(RM) ../bin/*.txt ../bin/jy
