[video](https://github.com/rbong/envi/raw/master/video/ipc.mkv)
In this video, you can see the programs opening together, changing directory
together, and not interrupting eachother. I demonstrate how text and programs
opened in the shell are not disturbed. I demonstrate how opening files in
the file manager opens them in vim. I show the debugging capabilities. I show
its reconnection abilities by switching workspaces and then running the script
again. I also close the programs entirely and then reconnect them. Finally, I
show them quitting together.

envi
====

Envi is a small programming tool written in bash. It ties together existing
tools like vim, vifm (a vi-like file manager), and a shell. It provides a full
shell and file manager to vim without any of the quirks and lacking features of
plugins that do the same. It is extensible through its tmux servers by merely
sending keys.

dependencies
====

envi needs vifm, tmux, Vim, and a terminal emulator (tested with xterm and st).
A tiling window manager is recommended. It also needs gdb if you plan to use
the debugging features. The script may not match your use, as it's not meant
for public usage. For example- lsview will not work well in vifm, programs are
opened in my preferred order.

installation
====

If you don't want cd commands generated by envi to show up in your command
history, set the environment variable HISTCONTROL to ignorespace. If you don't
want to use the st terminal emulator, place your terminal and an argument that
runs commands in the "terminal" variable in envi. The methods use to keep
commands invisible require a short PS1. To change this, set the PS1 variable to
a short string like '\$' when $TERM == screen\* in your .bashrc. Other shell
configuration can also be done this way.
To install envi in full (debugger and all), type in
```
make
sudo make install
```
If you do not plan to use gdb with envi and instead plan to use a tool like gdb
-tui instead for visual debugging, simply move envi to /usr/bin, or /usr/local/
bin. If you do plan to write scripts for envi, you may want to install it in
full.

operation
====

hjkl navigates in vifm, and keys work the way you would expect them to based on
vi(m) bindings (d, m/', f/F/t/T etc). Working directory of Vim and your
shell will be set automatically. Text typed in bash is untouched as its
directory is changed. Text files will be opened automatically in
Vim. Unknown file types are outputted to $HOME/.envi/unknown and then opened
normally in vifm so that you can modify the behaviour later. Behaviour of Vim
and vifm on initialization (rebindings, etc) can be set inside
$HOME/.envi/vifm-start and $HOME/.envi/vim-start. Quitting inside of Vim with
ZZ or inside vifm with ZQ or manually sending envi -q causes all the programs
to exit. If you "lose" a server, need to reload
configs, or accidentally closed it, run envi again; servers that
were already open will reconnect, and missing servers will be created anew.
The names of servers are kept in variables, so you should be able to add the
option to have more instances open if you wish. envi -o opens files. However,
the -o option replaces spaces with escaped spaces. The envi -O option is
equivalent to
```
for i in (arguments); do envi -o $i; done
```
As such, you can use globbing such as envi -O \*.c and other expressions.
To see how envi cleans filenames, or to use this output, send envi --c-f, envi
--c-t, and envi --cv to see how it cleans strings for vifm, tmux and vim. The
hacks used to prevent output from showing in the terminal work with both emacs
and vi keys enabled in bash. In the script, single sleep commands are sometimes
used to make sure that servers are initialized to avoid expensive loops. envi
is not written for other computers, and if it behaves strangely you should
increase the length of the sleep commands or write loops that ask tmux if the
servers exist yet; this still might not work. See the script for some of the
"creative" methods used. Please do not change these; they are based on trial
and error. envi will work best on a light system. Even though
it's a personal script, feel free to submit issues if you experience any
problems.

genvi
====

envi's gdb interface is called genvi. Call it with any options you want to pass
to gdb. File location will not be shown. Line number will automatically be
highlighted in Vim as it would be with gdb's textual user interface mode,
without any of the eccentricities.

modifying
====

When you are modifying, most extension should be done by sending keys through
the servers. The default names of the servers are tvim for Vim's tmux server,
tbsh for the shell's server, and tvif for vifm's server. You can access these
with
```
tmux send-keys -t(servername) (keys)
```
Vim's built in server capabilities are also used. A tmux server is only used
because Vim does not support reconnection. Vim's server can be accessed with
```
vim --servername vvim --remote-send (keys)
```
Vim's server is called vvim by default. There are several remote options for
Vim.  Search Vim's manual for "remote" to find these.
```
man vim
```
The simplest way to add new functions is to modify the vifm-start and vim-start
files and bind keys to the commands. Look inside the files and study the source
of envi to see my style for this. Do not add recursive calls to envi inside
envi. Call the functions directly.
You may wish to add support for envi and a complex utility such as gdb, as I
have done. Two tools are included to help with this. "ftee" is written by
racic@stackoverflow, and is included because it allows you to output text to
both a fifo and stdout without blocking. "press" is a utility that allows you
to filter text from unbuffered programs like python, gdb, tee, or even bash. If
you want to see how to do this, look at "genvi"- it is a very short script for
gdb.
