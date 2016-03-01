function! _vcd(dir)
   if a:dir != '' 
       exec 'cd' a:dir
   endif
   call system("!!echo (if [ (pgrep -P (pidof -s envish)) ]; tmux send-keys -tenvi C-z Enter Enter ^ /dev/null &; end); echo (sleep 0.1; tmux send-keys -tenvi M-v) ^ /dev/null &;")
   call system("vifm --server-name envi --remote -c vcd ^ /dev/null &; cd $argv")
endfunction
function! _zz()
   call system("tmux kill-session -tenvi ^ /dev/null &")
   call system("vifm --server-name envi --remote -c exit ^ /dev/null")
endfunction
command! -complete=dir -nargs=? Vcd call _vcd('<args>')
command! Scd exec 'cd' system ("if [ (pidof envish) ]; readlink /proc/(pidof -s envish)/cwd; end")
command! Fcd exec 'cd' system ("if [ (pidof envifm) ]; readlink /proc/(pidof -s envifm)/cwd; end")
nno ZZ :call _zz() \| wqa<CR>
