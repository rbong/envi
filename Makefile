CC     = gcc

all: ftee.c
	$(CC) ftee.c -o ftee
	$(CC) press.c -o press
clean:
	rm -rf ftee press
install:
	cp envi genvi ftee press /usr/local/bin
	ln -f $$(which vim) /usr/local/bin/envim
	ln -f $$(which vifm) /usr/local/bin/envifm
	ln -f $$(which fish) /usr/local/bin/envish
uninstall:
	cd /usr/local/bin && rm -rf envi genvi ftee press envim envifm envish
