set HISTCONTROL ignorespace
alias 'scd'='vim --servername envi --remote-send "<Esc>: Scd<CR>" ^ /dev/null &; vifm --server-name envi --remote -c scd ^ /dev/null &; cd $argv'
bind -M insert \ev 'if [ (pidof -s envim) != "" ] ^ /dev/null; cd (readlink /proc/(pidof -s envim)/cwd); commandline -f repaint; end'
bind -M normal \ev 'if [ (pidof -s envim) != "" ] ^ /dev/null; cd (readlink /proc/(pidof -s envim)/cwd); commandline -f repaint; end'
bind -M insert \ef 'if [ (pidof -s envifm) != "" ] ^ /dev/null; cd (readlink /proc/(pidof -s envifm)/cwd); commandline -f repaint; end'
bind -M normal \ef 'if [ (pidof -s envifm) != "" ] ^ /dev/null; cd (readlink /proc/(pidof -s envifm)/cwd); commandline -f repaint; end'
