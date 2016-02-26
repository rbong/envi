[video](https://github.com/rbong/envi/raw/master/video/ipc.mkv)

Note that the reconnection displayed in this video is temporarily not
available.

envi
====

Envi is a small programming tool written in bash. It ties together existing
tools like vim, vifm (a vi-like file manager), and a shell. It provides a full
shell and file manager to vim without any of the quirks and lacking features of
plugins that do the same. Primarily, it performs directory sharing between the
three tools. It is extensible through configuration files in the same format as
the ones shown in the script.

It is also possible, with this system, to use vim as a visualizer for command
prompts. For example, gdb, which is demonstrated in the genvi script.

dependencies
====

+vifm
+tmux
+Vim (compiled with clientserver capabilities)
+fish (more shells will be supported in the future)
+bash

Note that the script is not intended for others. It is merely for example
purposes. I may change it suddenly and not add extensibility. If you plan to
use envi on your own, please submit an issue with your desired usage and I will
begin to support it.

installation
====

If you don't want to use the urxvt terminal emulator, place your terminal and
an argument that runs commands in the "terminal" variable in envi. To install
envi in full (debugger and all), type in
```
make
sudo make install
```
If you do not plan to use gdb with envi and instead plan to use a tool like
gdb -tui instead for visual debugging, simply move envi to /usr/bin, or
/usr/local/bin. If you do plan to write scripts for envi, you may want to
install it in full.

operation
====

* vifm:
  * :vcd
    * changes active directory to vim's directory
  * :scd
    * changes active directory to the shell's directory
  * :fcd or space-r
    * changes the active directory of the shell and vim to vifm's directory
  * l
    * if it is a directory, opens the directory and calls :fcd
    * if it is a text file, opens it remotely in vim
  * h
    * enters the parent directory and calls :fcd
  * Ctrl-o
    * opens the previous directory and calls :fcd
  * Tab
    * switches the active pane and calls :fcd
  * see the vifm manual for the full commands not altered by the script
* Vim
  * :Vcd or _vcd()
    * changes the active directory of the shell and vim to vim's directory
  * :Scd
    * changes active directory to the shell's directory
  * :Fcd
    * changes active directory to vifm's directory
  * :ZZ or ZZ or _zz()
    * quit all programs and exit
* fish
  * scd
    * changes the active directory of the vifm and vim to the shell's directory
  * Alt-v
    * changes the active directory to vim's directory
  * Alt-f
    * changes the active directory to vifm's directory

genvi
====

Call genvi as you would call gdb. Requires compilation with the -g flag, as
with gdb.

configuration
====

Call the script once and then modify the configuration files inside ~/.envi (by
default).
