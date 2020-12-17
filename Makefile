#OBJS specifies which files to compile as part of the project
OBJS = src/galaxie.o src/parametres.o src/colonisation.o

#CC specifies which compiler we're using
CC = g++

#INCLUDE_PATHS specifies the additional include paths we'll need
INCLUDE_PATHS = -I"C:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\include"

#LIBRARY_PATHS specifies the additional library paths we'll need
LIBRARY_PATHS = -L"C:\Program Files\mingw-w64\x86_64-8.1.0-posix-seh-rt_v6-rev0\mingw64\lib"

#COMPILER_FLAGS specifies the additional compilation options we're using
# -w suppresses all warnings
# -Wl,-subsystem,windows gets rid of the console window
COMPILER_FLAGS = -O3 -march=native -Wall

#LINKER_FLAGS specifies the libraries we're linking against
LINKER_FLAGS = -lmingw32 -lSDL2main -lSDL2 -lSDL2_image

#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = colonisation

#This is the target that compiles our executable
ALL= colonisation.exe

# all : $(OBJS)
# 	$(CC) $(OBJS) $(INCLUDE_PATHS) $(LIBRARY_PATHS) $(COMPILER_FLAGS) $(LINKER_FLAGS) -o $(OBJ_NAME)

all: $(ALL)

clean:
	@rm -fr src/*.o *.exe src/*~ 

OBJS = src/galaxie.o src/parametres.o src/colonisation.o

src/galaxie.o:	src/galaxie.cpp src/galaxie.hpp
	$(CC) $(INCLUDE_PATHS) $(LIBRARY_PATHS) $(LINKER_FLAGS) $(COMPILER_FLAGS) -c src/galaxie.cpp -o src/galaxie.o

src/parametres.o: src/parametres.cpp src/parametres.hpp src/galaxie.hpp
	$(CC) $(INCLUDE_PATHS) $(LIBRARY_PATHS) $(LINKER_FLAGS) $(COMPILER_FLAGS) -c src/parametres.cpp -o src/parametres.o

src/colonisation.o: src/colonisation.cpp src/parametres.hpp src/galaxie.hpp
	$(CC) $(INCLUDE_PATHS) $(LIBRARY_PATHS) $(LINKER_FLAGS) $(COMPILER_FLAGS) -c src/colonisation.cpp -o src/colonisation.o

colonisation.exe : $(OBJS)
	$(CC) $(INCLUDE_PATHS) $(LIBRARY_PATHS) $(COMPILER_FLAGS)  $(OBJS) -o colonisation.exe $(LINKER_FLAGS)
