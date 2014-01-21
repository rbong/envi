CC     = gcc

all: ftee.c
	$(CC) ftee.c -o ftee
	$(CC) press.c -o press
clean:
	rm -rf ftee press
install:
	cp envi genvi ftee press /usr/local/bin
uninstall:
	cd /usr/local/bin
	rm -rf envi genvi ftee press
