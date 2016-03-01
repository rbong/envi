python
from re import compile
from subprocess import call

prev = None

def exe_re (cmd, rgx_str):
    res = gdb.execute (cmd, False, True)
    rgx = compile (rgx_str)
    srch = rgx.search (res)
    return srch.group (1)

def hook ():
    global prev
    line = exe_re ("frame", "([0-9]+)\n")
    src = exe_re ("info source", "\nLocated in (.+)\n")
    action = "--remote"
    if not prev or prev != src:
        action = "--remote-tab-silent"
    res = call (["vim", "--servername", "envi", action, src])
    prev = src
    res = call (["vim", "--servername", "envi", "--remote-send", "<esc>" + line + "GzozzV"])

def tryhook ():
    try:
        hook ()
    except:
        pass
end

define hook-stop
    python
tryhook ()
end
end

define hookpost-up
    python
tryhook ()
end
end

define hookpost-down
    python
tryhook ()
end
end
