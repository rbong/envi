install:
	cp envi genvi /usr/local/bin
	mkdir -p /usr/local/etc/envi
	cp etc/* /usr/local/etc/envi
	ln -f $$(which vim) /usr/local/bin/envim
	ln -f $$(which vifm) /usr/local/bin/envifm
	ln -f $$(which fish) /usr/local/bin/envish
uninstall:
	cd /usr/local/bin && rm -rf envi genvi envim envifm envish
