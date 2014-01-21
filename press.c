#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int i, chs, flen, match;
    char *filter;
    char buffer[BUFSIZ];
    ssize_t rbytes, wbytes;

    if (argc != 2)
    {
        printf ("Usage:\n someprog | press \"beginning of line filter\"\n");
        exit (EXIT_FAILURE);
    }
    filter = argv[1];
    flen = strlen (filter);
    chs = sizeof (char);
    match = 0;

    while (1)
    {
        rbytes = read (STDIN_FILENO, buffer, sizeof (buffer));
        if (rbytes < 0 && errno == EINTR)
            continue;
        if (rbytes <= 0)
            break;

        for (i = 0; i < rbytes; i++)
        {
            if ((i == 0 || buffer [i-1] == '\n'))
            {
                if (rbytes - i < flen)
                    match = 0;
                else if (strncmp(buffer+i, filter, flen) == 0)
                    match = 1;
                else
                    match = 0;
            }
            if (!match)
            {
                wbytes = write (STDOUT_FILENO, buffer+i, chs);
                if(wbytes == -1)
                    perror ("press: writing to stdout");
            }
        }
    }
}
