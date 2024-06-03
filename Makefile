#LDFLAGS=wc.o -o wc
#wc: wc.l

all: wc

clean:
	rm -f wc wc.o

#$(LEX) -t $> > $@
#lex  -t wc.l > wc.c
#cc    -c -o wc.o wc.c
#cc   wc.o wc.l   -o wc
