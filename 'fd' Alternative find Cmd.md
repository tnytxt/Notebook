source: "https://www.baeldung.com/linux/fd-find-alternative"

## 1. Overview

While working with Linux, we often want to search for files from the terminal.

The built-in *find* command is widely used for this purpose. However, there is an alternative command – *fd* – which has some additional features, including friendlier colorized output, faster search speed, and some useful defaults.

In this tutorial, we’ll look at how to use *fd**.*

## 2\. Installation

The *fd* utility is available in almost all package repositories. We can install the *fd* package in OpenSUSE, Fedora, or Manjaro. In Ubuntu 19.04 and newer, we can install the *fd-find* package:

```bash
$ sudo apt install fd-find
```

Although the command name is [*fdfind*](https://manpages.debian.org/buster/fd-find/fdfind.1.en.html) in Ubuntu, we can set an alias:

```bash
$ alias fd=fdfind
```

## 3\. Creating Test Files

For our examples, let’s quickly create some files in a temporary directory:

```bash
$ mkdir -p /tmp/baeldung-fd/one /tmp/baeldung-fd/two
$ cd /tmp/baeldung-fd/
$ touch one/test-File.txt two/test-File.txt
$ echo '#!/bin/sh\n:' | tee one/.hiddenFile.sh one/test-File.sh two/.hiddenFile.sh two/test-File.sh
$ chmod +x one/test-File.sh
```

After this step, we have a few normal text files, hidden files, and shell scripts. We’ve used the *tee* command to save the output of the *echo* command to all four files.

We’ve also set our current working directory to */tmp/baeldung-fd.*

Let’s view the directory structure with the *tree* command:

```bash
$ tree -a
.
├── one
│   ├── .hiddenFile.sh
│   ├── test-File.sh
│   └── test-File.txt
└── two
    ├── .hiddenFile.sh
    ├── test-File.sh
    └── test-File.txt

2 directories, 6 files
```

## 4\. Basic Usage

With no additional parameters, we can run *fd* to view the contents of the current directory:

```bash
$ fd
one
one/test-File.sh
one/test-File.txt
two
two/test-File.sh
two/test-File.txt
```

As we can see, ***fd* does not show hidden files by default.** This output will also be colorized if our terminal supports it.

The power of *fd* comes from the filters we apply. When we add filters, we can also provide a path argument to tell *fd* to search in that path, rather than the current directory.

Let’s look at how to filter.

### 4.1. Regular Expressions

By default, ***fd* treats the search pattern as a regular expression and performs a case-insensitive search**:

```bash
$ fd 'file[.]sh'
one/test-File.sh
two/test-File.sh
```

Here our *file\[.\]sh* expression was looking for any file containing  *file.sh* insensitive of case.

As the dot character is a regular expression wildcard, we enclosed it in square brackets \[\] to quote it. However, we can use the dot character unquoted to match any file in a particular directory:

```bash
$ fd . two
two/test-File.sh
two/test-File.txt
```

As we can only specify the path if we specify a pattern, the dot (.) is a useful match-all pattern.

### 4.2. Wildcard Match

If we wish to use wildcards like the asterisk (\*), as we might in other shell commands, instead of regular expressions, then **the *\-g* flag enables file globbing or matching by wildcard**:

```bash
$ fd 'test-*.sh' -g
one/test-File.sh
two/test-File.sh
```

### 4.3. Simple String Match

Sometimes we need to match a string containing regular expression special characters. Though we can quote them, it is easier to **indicate that the parameter should be matched as it is by using the *\-F* flag**:

```bash
$ fd -F 'file.sh'
one/test-File.sh
two/test-File.sh
```

This simple string match works by matching the pattern as a substring.

**We can enable case-sensitivity with the *\-s* flag.**

So, while the default search for *file* finds results:

```bash
$ fd file ./one
one/test-File.sh
one/test-File.txt
```

With the flag turned on, it no longer matches:

```bash
$ fd -s file ./one
# no match
```

Also, the case sensitive mode **is automatically enabled if the pattern contains an uppercase character**:

```bash
$ fd filE ./one
# no match
```

### 4.5. Show Hidden Files

*fd* omits hidden files by default. **We can include the hidden files in the search result with the *\-H* flag**:

```bash
$ fd -H file ./two
two/.hiddenFile.sh
two/test-File.sh
two/test-File.txt
```

**We can search for a file type with the *\-t* flag and a file type indicator.** Some common file type indicators:

- f, file – regular files
- d, directory – directories
- l, symlink – symbolic links
- x, executable – executable files
- e, empty – empty files or directories

Let’s try to list all subdirectories. Here we can use either *directory* or *d* after the *\-t* flag:

```bash
$ fd -t directory
one
two
```

We can repeat the *\-t* flag to combine several file type criteria. To find all empty files, we can use the *\-t* flag twice.

```bash
$ fd -t e -t f
one/test-File.txt
two/test-File.txt
```

In this example, the first *\-t* flag with argument *e* matches empty files or directories. The second *\-t* flag with argument *f* matches regular files. The combination gives us the list of regular files that are empty.

**We can also use the *\-e* flag to search for files having a particular extension.** To find files ending with extension *sh*:

```bash
$ fd -e sh
one/test-File.sh 
two/test-File.sh
```

We can repeat the *\-e* flag to match multiple extensions as well. For example, to search for the files with extensions *sh* or *txt*:

```bash
$ fd -e sh -e txt
one/test-File.sh
one/test-File.txt
two/test-File.sh
two/test-File.txt
```

### 5.3. Matching the Full Path

By default, the search pattern is only matched against the name of the file or directory. **With the *\-p* flag, the pattern is matched against the full path**:

Let’s search for all files in the */tmp* directory whose full path matches a given regular expression:

```bash
$ fd -p 'baeldung.*sh' /tmp 
/tmp/baeldung-fd/one/test-File.sh 
/tmp/baeldung-fd/two/test-File.sh
```

As we can see, the regular expression matches the absolute path of the files. We should note that this is still a substring match, though we may add regular expression anchors *^* and *$* to force the match to include the start or end of the path, respectively.

By default, *fd* searches in the current directory. To perform the search in some specific directories, we can specify multiple path arguments after the pattern.

We can search for all files in directories *one* and *two*:

```bash
$ fd . ./one ./two -t f 
one/test-File.sh 
one/test-File.txt 
two/test-File.sh 
two/test-File.txt
```

There are three components in this example:

1. We use a single dot as the required file pattern to match anything.
2. *./one* and *./two* are the paths where we are searching.
3. *\-t f* matches regular files and omits directories from the result.

## 6\. Advanced Usage

### 6.1. Traverse Symbolic Links

By default, *fd* does not follow symbolic links. **We can traverse symbolic links using the *\-L* flag.**

First, let’s create a symbolic link of the subdirectory named *one* with the [*ln*](https://man7.org/linux/man-pages/man1/ln.1.html) command:

```bash
$ ln -s one symone
```

Now let’s search for an executable file:

```bash
$ fd -t x
one/test-File.sh
```

As we can see, it does not show the contents of the newly created symbolic link. Let’s include the contents of the symlink by using the *\-L* flag:

```bash
$ fd -t x -L
one/test-File.sh
symone/test-File.sh
```

Now we have the contents of the symbolic link as well.

Sometimes we want to avoid traversing another filesystem while following symbolic links. **We can prevent entering another filesystem by using the *–one-file-system* flag.**

### 6.2. Control Directory Traversal Depth

We can also control the directory traversal depth using the flags *\-d, –min-depth,* and *–exact-depth*. Let’s create a few directories, one within another:

```bash
$ mkdir -p ./two/sub/moresub
```

This command searches for all files and directories, however, maximum depth is limited to 2:

```bash
$ fd -d 2
one 
one/test-File.sh 
one/test-File.txt 
symone 
two 
two/sub 
two/test-File.sh 
two/test-File.txt
```

Conversely, we can specify to find files at least 2 levels below the current directory:

```bash
$ fd --min-depth 2 
one/test-File.sh 
one/test-File.txt 
two/sub 
two/sub/moresub 
two/test-File.sh 
two/test-File.txt
```

And, we can perform our searches at a certain depth:

```bash
$ fd --exact-depth 2 
one/test-File.sh 
one/test-File.txt 
two/sub 
two/test-File.sh 
two/test-File.txt
```

Sometimes we want to invert the search result so that only the files or directories that do not match a given pattern are listed. **The *\-E* flag shows results that do not match the given glob pattern.** We should note that this flag does not support regular expressions.

For example, the wildcard pattern *\*.sh* matches files with extension  *sh.* If we want to search for any file that does not end with extension *sh*, we can use the following command:

```bash
$ fd -E '*.sh' -t f
one/test-File.txt
two/test-File.txt
```

Here, *fd* has returned all files and excluded the files matching wildcard *\*.sh* from the result.

### 6.4. Filter by Size

**The *\-S* or *–size* flag allows us to specify the file size limit.** To understand with an example, let’s create a 2 KB file with the [*dd*](https://man7.org/linux/man-pages/man1/dd.1.html) command in directory *two*:

```bash
$ dd if=/dev/random of=./two/largefile count=4 2> /dev/null
```

To search for files with size 1 KB or larger, we can use the expression *+1k* with the *\-S* flag:

```bash
$ fd -S +1k 
two/largefile
```

The result is the file we just created with the *dd* command, as its size meets our criteria.

Conversely, we can use *\-1k* to search for 1 KB or smaller files:

```bash
$ fd -S -1k
one/test-File.sh
one/test-File.txt
two/test-File.sh
two/test-File.txt
```

Similarly, we can use *b* for *bytes*, and *m* for *megabytes*, for example. The comprehensive list is available on the [man page](https://man7.org/linux/man-pages/man4/fd.4.html).

### 6.5. Filter by Date

Sometimes we need to search for files on the basis of creation date, modified date, or the last access date. **We can filter by modified date using the *–changed-within* and *–changed-before* flags.** These two flags accept both timestamp and duration as an argument.

We can specify the duration in units such as *week*, *day*, or *min**.* We can also use the plural forms of the duration units:

```bash
$ fd -t x --changed-before "2020-09-01 11:00:00"
one/test-File.sh
$ fd -t x --changed-within 2day
one/test-File.sh
$ fd -t x --changed-within 2days
one/test-File.sh
```

However, *fd* does not support searching by created date or last access date.

Sometimes, we want to process the result of a file search. We can pass the result to [*xargs*](https://www.baeldung.com/linux/xargs) to run some commands on the result set. However, *fd* allows us to invoke commands directly. The following expressions are expanded before the execution of the command:

- {} path
- {.} path without file extension
- {/} basename
- {/.} basename without file extension
- {//} parent directory

### 7.1. Batch Execution

**We can run a command only once on the whole result set with the *\-X* flag.** In this mode, *fd* passes the search result as a list of arguments to the given command.

Let’s pass our results to the *[file](https://man7.org/linux/man-pages/man1/file.1.html)* command, which outputs the type of the files on its command line:

```bash
$ fd -t f -X file
one/test-File.sh:  POSIX shell script, ASCII text executable 
one/test-File.txt: empty 
two/largefile:     data 
two/test-File.sh:  POSIX shell script, ASCII text executable 
two/test-File.txt: empty
```

As we can see, the above command is equivalent to the following command where all the arguments are passed at once:

```bash
$ file one/test-File.sh one/test-File.txt two/largefile two/test-File.sh two/test-File.txt
```

### 7.2. Repeated Execution

On the other hand, **we can run a command on each entry of the result set with the *\-x* flag.** To understand how we can run a particular command on each entry of the result set, let’s use the *\-x* flag to create a backup copy of each file.

For example, let’s tell *fd* to invoke the *cp* command in the specified format on each entry of the search result:

```bash
$ fd -Ht f -x cp {} {}.bak
```

Now let’s check that new files with the extension *.bak* were created:

```bash
$ fd -Ht f -e bak
one/.hiddenFile.sh.bak 
one/test-File.sh.bak 
one/test-File.txt.bak 
two/.hiddenFile.sh.bak 
two/largefile.bak 
two/test-File.sh.bak 
two/test-File.txt.bak
```

As we can see, we have created backups by executing *cp* with the -x flag.

## 8\. Comparison with find

According to the [benchmark](https://github.com/sharkdp/fd#benchmark) on its GitHub page, *fd* runs much faster than the *find* command. As opposed to *find*, *fd* colorizes the output, ignores hidden files, and treats the input search pattern as a regular expression by default.

On the other hand, *fd* does not support all the functionalities of the *find* command. Some options such as the *\-prune* flag of the *find* command are not available with *fd*. The *find* command also provides more control over the formatting of the output.

## 9\. Conclusion

In this tutorial, we explored several ways to search for files using *fd*. We also saw how to further limit the searches using a number of filter criteria. Finally, we briefly compared *fd* with the *find* command.