SDLFLAG=`pkg-config --cflags --libs sdl2`
LUAFLAG=`pkg-config --cflags --libs lua`
OTHERFLAG= -lSDL2_ttf -lSDL2_image -lSDL2_mixer
RM= rm -rf
all:
	gcc *.c -o ../bin/jy $(LUAFLAG) $(SDLFLAG) $(OTHERFLAG)

clean:
	$(RM) ../bin/*.txt ../bin/jy
