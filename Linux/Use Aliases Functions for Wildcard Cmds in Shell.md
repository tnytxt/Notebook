The issue with the alias `alias uza='unzip '*.zip''` is that the shell treats the single quotes (`'`) as literal string delimiters, so the `*` wildcard is not interpreted properly. Additionally, the command syntax is problematic for an alias because the wildcard is expanded when the alias is defined, not when it is executed.

Here’s how to fix it:
#### Use a Function Instead

You can define a shell function to achieve the desired behaviour. Functions are more flexible than aliases for commands with arguments or wildcards. Add this to your `.bashrc` or `.zshrc`:

```bash
uza() {
  unzip '*.zip'
}
```

This way, the wildcard will be interpreted at runtime.
#### Alternative: Escape the Wildcard

If you insist on using an alias, you can escape the wildcard (`*`) using single quotes or backslashes. However, aliases are less flexible for this use case:

```bash
alias uza="unzip '*.zip'"
```

But functions are generally better for commands involving wildcards. After adding the function or alias, reload your shell configuration with:

```bash
source ~/.bashrc  # or ~/.zshrc
```

Now you can use `uza` to unzip all `.zip` files in the current directory.