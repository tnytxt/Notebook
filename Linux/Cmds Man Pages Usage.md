# Comments and other ways to read man info at end of this document

The man command, is short for manual. It provides access to the various up-to-date on-board documentation pages. This helps users utilize the Linux/Unix operating systems in a better manner.
What is man ?

The man command is a manual pager which provides the user with documentation about specific functions, system calls, and commands. The man command uses the less pager by default. (See man less for more information.)

Note that a man page is likely to contain better up-to-date information compared to what can be found on the internet. It is wise to compare the man page usage and options with that found on the web.
How to use man ?

To use the man command effectively we have to know the manual pages system. The manual pages are distributed in 8 sections. Each provides documentation on particular topics.
What are the manual page sections ?

    - Programs, shell commands and daemons.
    System calls.
    Library calls.
    Special files, drivers, and hardware.
    Configuration files.
    Games.
    Miscellaneous commands.
    System administration commands and daemons.

Examples

To get the printf library function documentation (section 3):

# man 3 printf

To get the printf shell builtin documentation (section 1):

# man 1 printf

You can learn more about the man command and its options:

# man man

How to manage the index caches database

To update the existing database, or to create it, use the -c or –create flag with the mandb command:

# mandb --create

To do a correctness check on the documentation database use the -t or –test flag:

# mandb --test

How to export manual pages

To export a man page, use the -t flag with the man command:

man -t 5 dnf.conf > manual.ps  

This will create a PostScript file with the contents of the dnf.conf man page from section 5.

Alternatively, if you want to output a PDF file, use something like this instead:

man -Tpdf 5 dnf.conf > dnf.conf.pdf 

You will need the groff-perl package installed for this command to work.

# other methods to read amn pages
 yelp man:bash
 e,g, try yelp info:rsync

# Comments

> man pages uses systemd service `man-db-cache-update.service` to manage cache automatically

> If you use some exotic language (i.e. different than English;) it is very useful to know how to open English man page (translated man pages very often are not up-to-date):
LANG=en man ffmpeg

It is very handy to know how to search man pages (so how to use ‘less’ effectively).

Enable/disable “Ignore case” mode: type “-I”
Search for “text”: type “/text” (+enter)

---

> If you happen to be plain-text oriented, as I am, there’s a simple way to “translate” man pages into a plain text format. Assuming the subject to be researched is “grep”, the command would be like this:

$ man grep | col -b | tee ~/grep.man.txt

I do this when I get frustrated by the inability to just view it as a text file: easy to understand, easily scrollable and compatible with other tools.
