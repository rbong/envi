[video](https://github.com/rbong/envi/raw/master/video/ipc.mkv)

Note that the reconnection displayed in this video is temporarily not
available.

envi
====

* Shares active directory between discrete sessions of vim, vifm (vi file manager), and fish (friendly shell)
* Files opened in the filemanager are opened in vim
* Provides a shell/file manager to vim without quirks/limitations
* The current location of gdb is opened in vim
* Provided as an example for personal interprocess communication systems

dependencies
====

* vifm
* tmux
* Vim (compiled with clientserver capabilities)
* fish (more shells will be supported in the future)
* bash

Note that the script is not intended for others. It is merely for example
purposes. I may change it suddenly and not add extensibility. If you plan to
use envi on your own, please submit an issue with your desired usage and I will
begin to support it.

installation
====

```
make
sudo make install
```

operation
====

## Vvifm

Command/Keybinding | Operation
-------------------|----------
:vcd | changes active directory to vim's directory
:scd | changes active directory to the shell's directory
:fcd or space-r | changes the active directory of the shell and vim to vifm's directory
l | if it is a directory, opens the directory and calls :fcd. if it is a text file, opens it remotely in vim
h | enters the parent directory and calls :fcd
Ctrl-o | opens the previous directory and calls :fcd
Tab | switches the active pane and calls :fcd

## Vim

Command/Keybinding | Operation
-------------------|----------
:Vcd or _vcd() | changes the active directory of the shell and vim to vim's directory
:Scd | changes active directory to the shell's directory
:Fcd | changes active directory to vifm's directory
:ZZ or ZZ or _zz() | quit all programs and exit

## fish

Command/Keybinding | Operation
-------------------|----------
scd | changes the active directory of the vifm and vim to the shell's directory
Alt-v | changes the active directory to vim's directory
Alt-f | changes the active directory to vifm's directory

genvi
====

Call genvi as you would call gdb. Requires compilation with the -g flag, as
with gdb.

configuration
====

Call the script once and then modify the configuration files inside ~/.envi (by
default).
