CC = gcc
LDFLAGS = -lrt
RM = /bin/rm -f

.SUFFIXES : .c .o

INC = 
LIBS = 
CFLAGS = -D_REENTRANT -pthread -g -w -Wall -std=c99 -lcurses

EXESRCS = client.c
EXESRCS2 =server.c 

LIBOBJS = ${LIBSRC:.c=.o}
OBJECTS2 = ${EXESRCS2:.c=.o}
OBJECTS = ${EXESRCS:.c=.o}

TARGETS = client
TARGETS2 = server

$@.o : $@.c
	$(CC) $(CFLAGS) -c -o $<

all: targ1 targ2

targ1: ${LIBOBJS} ${OBJECTS}
	${CC} -o ${TARGETS} ${OBJECTS} ${LDFLAGS} ${LIBOBJS} ${CFLAGS} 

targ2: ${LIBOBJS} ${OBJECTS2}
	${CC} -o ${TARGETS2} ${OBJECTS2} ${LDFLAGS} ${LIBOBJS} ${CFLAGS} 

clean :
	${RM} ${OBJECTS} ${OBJECTS2} ${TARGETS} ${LIBOBJS} core tags
