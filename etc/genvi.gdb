python
from re import compile
from subprocess import call
end

define hook-stop
    python
def exe_re (cmd, rgx_str):
    res = gdb.execute (cmd, False, True)
    rgx = compile (rgx_str)
    srch = rgx.search (res)
    return srch.group (1)

def hook():
    line = exe_re ("frame", "([0-9]+)\n")

    src = exe_re ("info source", "\nLocated in (.+)\n")

    res = call (["vim", "--servername", "envi", "--remote", src])
    res = call (["vim", "--servername", "envi", "--remote-send", "<esc>" + line + "GzozzV"])

try:
    hook ()
except:
    pass
end
end
