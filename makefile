
SOME_OTHER_VARIABLE :=1
ANOTHER_VARIABLE :=2
SOME_VARIABLE := $(SOME_OTHER_VARIABLE)/$(ANOTHER_VARIABLE)
$(info SOME_VARIABLE = $(SOME_VARIABLE))
CC = g++
CFLAGS = -g -Wall -ansi
INCLUDE = -I./
INCLUDE += -I./2/  
#if 1/ and 2/ both have 1.h but 1/1.h include 3.h, no dir has=>error
#2/1.h include 2.h, "g++ -I./2/ ./1/" got 2.h in dir 1/ therefore success!  
#1/1.h  2.h
#2/1.h
INCLUDE += -I./1/
#INCLUDE += -I./2/
.out:hello.o  2.o 3.o
        $(CC) -o hello.out hello.o 2.o 3.o
hello.o:hello.cpp
        $(CC) $(CFLAGS) -c hello.cpp $(INCLUDE) 
#1.o: 1/1.cpp 1/1.h
#       $(CC) -c 1.cpp 
2.o:2.cpp b.h
        $(CC) -c 2.cpp
3.o:3.cpp a.h b.h c.h
        $(CC) -c 3.cpp

clean:
        rm -f  2.o 3.o hello.o hello.out
