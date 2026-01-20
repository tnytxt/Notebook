Debian Cmd: Manually Install Pkg to Update Existing

2 Methods to Install a downloaded package to update an existing one without unistalling.

# Method 1: Using `dpkg` 
Use `dpkg` command to install new package directly. This'll update
the package if newer ver is available. 

1. Open terminal in location of '.deb' file. 
2. Run command: sudo dpkg -i package_name.deb 

If install reports dependency issues run: sudo apt-get install -f 

# Method 2: Using `apt` 

This method auto handles dependencies, you can also use `apt`. 

1. Open terminal in location of downloaded package. 
2. Run cmd: sudo apt install ./package_name.deb 

This command ensures necessary dependencies are met during install. 
